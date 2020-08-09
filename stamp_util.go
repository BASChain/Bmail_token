package stamp_token

import (
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
	"net"
	"net/http"
	"syscall"
	"time"
)

type ConnectionSaver func(fd int32) bool

func SetConnectionSaver(connSaver ConnectionSaver) {
	http.DefaultTransport = &http.Transport{
		Proxy: http.ProxyFromEnvironment,
		DialContext: (&net.Dialer{
			Timeout:   30 * time.Second,
			KeepAlive: 30 * time.Second,
			DualStack: true,
			Control: func(network, address string, c syscall.RawConn) error {
				if connSaver != nil {
					f := func(fd uintptr) {
						connSaver(int32(fd))
					}
					return c.Control(f)
				}
				return nil

			},
		}).DialContext,
		ForceAttemptHTTP2:     true,
		MaxIdleConns:          100,
		IdleConnTimeout:       90 * time.Second,
		TLSHandshakeTimeout:   10 * time.Second,
		ExpectContinueTimeout: 1 * time.Second,
	}
}

type Details struct {
	Issuer  common.Address `json:"issuer"`
	Name    string         `json:"name"`
	Symbol  string         `json:"symbol"`
	IconUrl string         `json:"icon"`
	Balance int64          `json:"balance"`
	Active  int64          `json:"active"`
	Epoch   int64          `json:"epoch"`
}

func QueryConn(url string, stampAddr common.Address) (*ethclient.Client, *BasStamp, error) {
	conn, err := ethclient.Dial(url)
	if err != nil {
		return nil, nil, err
	}
	token, err := NewBasStamp(stampAddr, conn)
	return conn, token, err
}

func DetailsOfStamp(url string, stampAddr, userAddr common.Address) (*Details, error) {
	client, stamp, err := QueryConn(url, stampAddr)
	defer client.Close()

	if err != nil {
		return nil, err
	}

	data, err := stamp.ActiveBalanceOf(nil, userAddr)
	if err != nil {
		return nil, err
	}

	details := &Details{
		Balance: data.Balance.Int64(),
		Active:  data.ActivedSum.Int64(),
		Epoch:   data.Epoch.Int64(),
	}

	basic, err := stamp.BasicSetting(nil)
	if err != nil {
		return nil, err
	}
	details.Issuer = basic.I
	details.Symbol = basic.S
	details.IconUrl = basic.Icon
	details.Name = basic.N

	return details, nil
}
