# DNS Resolution Tests

All queries were made directly to Azure DNS name server `ns1-06.azure-dns.com`.

## A Record – www

```powershell
nslookup www.MehdiMejri.com ns1-06.azure-dns.com
```

Output:

```
Server:  UnKnown
Address:  13.107.236.6

Name:    www.MehdiMejri.com
Address: 20.124.187.162
```

✅ Correctly resolved `www.MehdiMejri.com` to the configured public IP address.

---

## Alias A Record – aliaswww

```powershell
nslookup aliaswww.MehdiMejri.com ns1-06.azure-dns.com
```

Output:

```
Server:  UnKnown
Address:  13.107.236.6

Name:    aliaswww.MehdiMejri.com
Address: 20.124.187.162
```

✅ Alias A record returned the same IP address, proving that the alias correctly points to the Azure resource.

---

## CNAME Record – blog

```powershell
nslookup blog.MehdiMejri.com ns1-06.azure-dns.com
```

Output:

```
Server:  UnKnown
Address:  13.107.236.6

Name:    blog.MehdiMejri.com
```

⚠️ No CNAME target was returned.

This means the `blog.MehdiMejri.com` record currently exists but does not resolve to another hostname.

Expected CNAME behavior:

```
blog.MehdiMejri.com canonical name = www.MehdiMejri.com
```

---

## TXT Record – verification

```powershell
nslookup -type=TXT MehdiMejri.com ns1-06.azure-dns.com
```

Output:

```
Server:  UnKnown
Address:  13.107.236.6

MehdiMejri.com text =

        "azure-verification=12345"
```

✅ TXT record returned the expected Azure verification value.

---

# Conclusion

DNS resolution through Azure DNS name server `ns1-06.azure-dns.com` is working correctly.

Validated records:

| Record | Status |
|---|---|
| A record (`www`) | ✅ Resolved to `20.124.187.162` |
| Alias A record (`aliaswww`) | ✅ Resolved to `20.124.187.162` |
| CNAME (`blog`) | ⚠️ No CNAME target configured |
| TXT verification | ✅ Returned `azure-verification=12345` |

After delegating the Azure DNS name servers at the domain registrar, these records will resolve publicly without specifying the DNS server manually.