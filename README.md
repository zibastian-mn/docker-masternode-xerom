Introduction
---
This image is running a Xerom Node

**GitHub:** https://github.com/zibastian-mn/docker-masternode-xerom/  
**Docker:** https://hub.docker.com/r/zibastian/xerom-node/

---
Starting a node
---
```sh
docker run -d --restart=unless-stopped \
               -p 30311:30311/udp -p 30311:30311/tcp -e port=30311  \
               -e nodeType=[chain OR xero OR link OR super]  \
               --name xero-node  \
               zibastian/xerom-node
```
---
Node Info
---
```sh
docker exec -ti xero-node node-info
```

The output contains all the required information for registering your node at https://wallet.xerom.org/#contracts 

---
Changing node type
---
```sh
docker exec -ti xero-node node-setup [chain OR xero OR link OR super]
```

Do not forget to delete your node in the previous contract and add it again at https://wallet.xerom.org/#contracts

---
Container logs
---
```bash
docker logs -f xero-node [--tail 20]
```

---
Donation
---
If this image helps you reduce time to deploy, I like beer :) 

**XERO:** 0x0DD404e916dc184BdAAcF5a46B455B8BcD3B2b15  
**ETH:** 0x13B0E1c351e4a9Eae4980ae5469022808C8B3B6D  
**LTC:** MBiWJ3HB69nXtfxvdFmZE5iGm5AXWPRZuh  
**BTC:** 3NshfttcuYKNrU8CCwFqzuu8x95VtGQeu4  
