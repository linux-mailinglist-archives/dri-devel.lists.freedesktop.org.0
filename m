Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB1713A0
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 10:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055A6E207;
	Tue, 23 Jul 2019 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76E4B6E207
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 08:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 7127D2AA137;
 Tue, 23 Jul 2019 10:11:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id SAxUITNiYl6Y; Tue, 23 Jul 2019 10:11:50 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 4BD6F2AA115;
 Tue, 23 Jul 2019 10:11:50 +0200 (CEST)
Received: from [::1] by thor with esmtp (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hpptW-0007QR-Mm; Tue, 23 Jul 2019 10:11:34 +0200
Subject: Re: Why is Thunderbolt 3 limited to 2.5 GT/s on Linux?
To: =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
References: <91de711591780e83c70e8f61747725855f6dee99.camel@gmail.com>
 <20190628103204.GJ2640@lahna.fi.intel.com>
 <f550f4a25a7ee7fecd80f7213c3be127ed0323e7.camel@gmail.com>
 <20190628113415.GL2640@lahna.fi.intel.com>
 <ecebae84c91fa31a1207c30c0fe4ed907642dbb9.camel@gmail.com>
 <c3b38b60-7c1a-730d-8de0-e3c880902003@daenzer.net>
 <627b7fff64edcba0f8d8b5ced79a351821c419c7.camel@gmail.com>
 <792d0f36-b8ae-bef9-3b07-95677637ba00@daenzer.net>
 <f986d6687e2b1f1fc8a93f86cbc8fd1ab971663a.camel@gmail.com>
 <d1dfe289-8501-8848-6324-c43d6e66a77f@daenzer.net>
 <CAAxE2A4hgaJ6+AoOGz=b+1aRQEb+eKB88N82KGkcU1w_dnffOQ@mail.gmail.com>
 <ba05faee86fd702f0ba9baa2322a5e32c27432d7.camel@gmail.com>
 <CAAxE2A6K-oaZqOJr+k0fZfwCmrPO+tfygu8EjDwk9PNgk4qU=Q@mail.gmail.com>
 <8f0c2d7780430d40dd1e17a82484d236eae3f981.camel@gmail.com>
 <9d3e2499-e55d-c095-e73e-392440e2bf47@daenzer.net>
 <f59f00d64c23ec74d44e5cf4ce126be2b8b42922.camel@gmail.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Openpgp: preference=signencrypt
Autocrypt: addr=michel@daenzer.net; prefer-encrypt=mutual; keydata=
 mQGiBDsehS8RBACbsIQEX31aYSIuEKxEnEX82ezMR8z3LG8ktv1KjyNErUX9Pt7AUC7W3W0b
 LUhu8Le8S2va6hi7GfSAifl0ih3k6Bv1Itzgnd+7ZmSrvCN8yGJaHNQfAevAuEboIb+MaVHo
 9EMJj4ikOcRZCmQWw7evu/D9uQdtkCnRY9iJiAGxbwCguBHtpoGMxDOINCr5UU6qt+m4O+UD
 /355ohBBzzyh49lTj0kTFKr0Ozd20G2FbcqHgfFL1dc1MPyigej2gLga2osu2QY0ObvAGkOu
 WBi3LTY8Zs8uqFGDC4ZAwMPoFy3yzu3ne6T7d/68rJil0QcdQjzzHi6ekqHuhst4a+/+D23h
 Za8MJBEcdOhRhsaDVGAJSFEQB1qLBACOs0xN+XblejO35gsDSVVk8s+FUUw3TSWJBfZa3Imp
 V2U2tBO4qck+wqbHNfdnU/crrsHahjzBjvk8Up7VoY8oT+z03sal2vXEonS279xN2B92Tttr
 AgwosujguFO/7tvzymWC76rDEwue8TsADE11ErjwaBTs8ZXfnN/uAANgPLQjTWljaGVsIERh
 ZW56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD6IXgQTEQIAHgUCQFXxJgIbAwYLCQgHAwIDFQID
 AxYCAQIeAQIXgAAKCRBaga+OatuyAIrPAJ9ykonXI3oQcX83N2qzCEStLNW47gCeLWm/QiPY
 jqtGUnnSbyuTQfIySkK5AQ0EOx6FRRAEAJZkcvklPwJCgNiw37p0GShKmFGGqf/a3xZZEpjI
 qNxzshFRFneZze4f5LhzbX1/vIm5+ZXsEWympJfZzyCmYPw86QcFxyZflkAxHx9LeD+89Elx
 bw6wT0CcLvSv8ROfU1m8YhGbV6g2zWyLD0/naQGVb8e4FhVKGNY2EEbHgFBrAAMGA/0VktFO
 CxFBdzLQ17RCTwCJ3xpyP4qsLJH0yCoA26rH2zE2RzByhrTFTYZzbFEid3ddGiHOBEL+bO+2
 GNtfiYKmbTkj1tMZJ8L6huKONaVrASFzLvZa2dlc2zja9ZSksKmge5BOTKWgbyepEc5qxSju
 YsYrX5xfLgTZC5abhhztpYhGBBgRAgAGBQI7HoVFAAoJEFqBr45q27IAlscAn2Ufk2d6/3p4
 Cuyz/NX7KpL2dQ8WAJ9UD5JEakhfofed8PSqOM7jOO3LCA==
Message-ID: <3b7532dd-f937-1909-28c9-b178d417135e@daenzer.net>
Date: Tue, 23 Jul 2019 10:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f59f00d64c23ec74d44e5cf4ce126be2b8b42922.camel@gmail.com>
Content-Language: en-CA
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "michael.jamet@intel.com" <michael.jamet@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0yMiAxMTozOSBhLm0uLCBUaW11ciBLcmlzdMOzZiB3cm90ZToKPj4+Cj4+PiAx
LiBXaHkgaXMgdGhlIEdUVC0+VlJBTSBjb3B5IHNvIG11Y2ggc2xvd2VyIHRoYW4gdGhlIFZSQU0t
PkdUVAo+Pj4gY29weT8KPj4+Cj4+PiAyLiBXaHkgaXMgdGhlIGJ1cyBsaW1pdGVkIHRvIDI0IEdi
aXQvc2VjPyBJIHdvdWxkIGV4cGVjdCB0aGUKPj4+IFRodW5kZXJib2x0IHBvcnQgdG8gZ2l2ZSBt
ZSBhdCBsZWFzdCAzMiBHYml0L3NlYyBmb3IgUENJZSB0cmFmZmljLgo+Pgo+PiBUaGF0J3MgdW5y
ZWFsaXN0aWMgSSdtIGFmcmFpZC4gQXMgSSBzYWlkIG9uIElSQywgZnJvbSB0aGUgR1BVIFBPVgo+
PiB0aGVyZSdzIGFuIDggR1QvcyB4NCBQQ0llIGxpbmssIHNvIH4yOS44IEdiaXQvcyAoPSAzMiBi
aWxsaW9uIGJpdC9zOwo+PiBJCj4+IG1pc3NlZCB0aGlzIG51YW5jZSBvbiBJUkMpIGlzIHRoZSB0
aGVvcmV0aWNhbCByYXcgYmFuZHdpZHRoLiBIb3dldmVyLAo+PiBpbgo+PiBwcmFjdGljZSB0aGF0
J3Mgbm90IGFjaGlldmFibGUgZHVlIHRvIHZhcmlvdXMgb3ZlcmhlYWRbMF0sIGFuZCBJJ20KPj4g
b25seQo+PiBzZWVpbmcgdXAgdG8gfjkwJSB1dGlsaXphdGlvbiBvZiB0aGUgdGhlb3JldGljYWwg
YmFuZHdpZHRoIHdpdGggYQo+PiAibm9ybWFsIiB4MTYgbGluayBhcyB3ZWxsLiBJIHdvdWxkbid0
IGV4cGVjdCBoaWdoZXIgdXRpbGl6YXRpb24KPj4gd2l0aG91dAo+PiBzZWVpbmcgc29tZSBldmlk
ZW5jZSB0byBzdWdnZXN0IGl0J3MgcG9zc2libGUuCj4+Cj4+Cj4+IFswXSBBY2NvcmRpbmcgdG8K
Pj4gaHR0cHM6Ly93d3cudGVzdGVkLmNvbS90ZWNoLzQ1NzQ0MC10aGVvcmV0aWNhbC12cy1hY3R1
YWwtYmFuZHdpZHRoLXBjaS1leHByZXNzLWFuZC10aHVuZGVyYm9sdC8KPj4gLCBQQ0llIDMuMCB1
c2VzIDEuNTQlIG9mIHRoZSByYXcgYmFuZHdpZHRoIGZvciBpdHMgaW50ZXJuYWwgZW5jb2Rpbmcu
Cj4+IEFsc28ga2VlcCBpbiBtaW5kIGFsbCBDUFU8LT5HUFUgY29tbXVuaWNhdGlvbiBoYXMgdG8g
Z28gdGhyb3VnaCB0aGUKPj4gUENJZQo+PiBsaW5rLCBlLmcuIGZvciBwcm9ncmFtbWluZyB0aGUg
dHJhbnNmZXJzLCBpbi1iYW5kIHNpZ25hbGxpbmcgZnJvbSB0aGUKPj4gR1BVIHRvIHRoZSBQQ0ll
IHBvcnQgd2hlcmUgdGhlIGRhdGEgaXMgYmVpbmcgdHJhbnNmZXJyZWQgdG8vZnJvbSwgLi4uCj4g
Cj4gR29vZCBwb2ludCwgSSB1c2VkIDEwMjQgYW5kIG5vdCAxMDAwLiBNeSBtaXN0YWtlLgo+IAo+
IFRoZXJlIGlzIHNvbWV0aGluZyBlbHNlOgo+IEluIHRoZSBzYW1lIGJlbmNobWFyayB0aGVyZSBp
cyBhICJmaWxsLT5HVFQgICxTRE1BIiByb3cgd2hpY2ggaGFzIGEKPiA0MDM1IE1CL3MgbnVtYmVy
LiBJZiB0aGF0IHRyYWZmaWMgZ29lcyB0aHJvdWdoIHRoZSBUQjMgaW50ZXJmYWNlIHRoZW4KPiB3
ZSBqdXN0IGZvdW5kIG91ciAzMiBHYml0L3NlYy4KClRoZSBHUFUgaXMgb25seSBjb25uZWN0ZWQg
dG8gdGhlIGhvc3QgdmlhIFBDSWUsIHRoZXJlJ3Mgbm93aGVyZSBlbHNlIGl0CmNvdWxkIGdvIHRo
cm91Z2guCgoKPiBOb3cgdGhlIHF1ZXN0aW9uIGlzLCBpZiBJIHVuZGVyc3RhbmQgdGhpcyBjb3Jy
ZWN0bHkgYW5kIHRoZSBTRE1BIGNhbgo+IGluZGVlZCBkbyAzMiBHYml0L3NlYyBmb3IgImZpbGwt
PkdUVCIsIHRoZW4gd2h5IGNhbid0IGl0IGRvIHRoZSBzYW1lCj4gd2l0aCBvdGhlciBraW5kcyBv
ZiB0cmFuc2ZlcnM/IE5vdCBzdXJlIGlmIHRoZXJlIGlzIGEgZ29vZCBhbnN3ZXIgdG8KPiB0aGF0
IHF1ZXN0aW9uIHRob3VnaC4KPiAKPiBBbHNvIEkgc3RpbGwgZG9uJ3QgZnVsbHkgdW5kZXJzdGFu
ZCB3aHkgR1RULT5WUkFNIGlzIHNsb3dlciB0aGFuIFZSQU0tCj4+IEdUVCwgd2hlbiB0aGUgYmFu
ZHdpZHRoIGlzIGNsZWFybHkgYXZhaWxhYmxlLgoKV2hpbGUgdGhvc2UgYXJlIGludGVyZXN0aW5n
IHF1ZXN0aW9ucyBhdCBzb21lIGxldmVsLCBJIGRvbid0IHRoaW5rIHRoZXkKd2lsbCBnZXQgdXMg
Y2xvc2VyIHRvIHNvbHZpbmcgeW91ciBwcm9ibGVtLiBJdCBjb21lcyBkb3duIHRvIGlkZW50aWZ5
aW5nCmluZWZmaWNpZW50IHRyYW5zZmVycyBhY3Jvc3MgUENJZSBhbmQgb3B0aW1pemluZyB0aGVt
LgoKCj4gU2lkZSBub3RlOiB3aXRoIHJlZ2FyZHMgdG8gdGhhdCAxLjUlIGZpZ3VyZSwgdGhlIFRC
MyB0ZWNoIGJyaWVmWzBdCj4gZXhwbGljaXRseSBtZW50aW9ucyB0aGlzIGFuZCBzYXlzIHRoYXQg
aXQgaXNuJ3QgY2FycmllZCBvdmVyOiAidGhlCj4gdW5kZXJseWluZyBwcm90b2NvbCB1c2VzIHNv
bWUgZGF0YSB0byBwcm92aWRlIGVuY29kaW5nIG92ZXJoZWFkIHdoaWNoCj4gaXMgbm90IGNhcnJp
ZWQgb3ZlciB0aGUgVGh1bmRlcmJvbHQgMyBsaW5rIHJlZHVjaW5nIHRoZSBjb25zdW1lZAo+IGJh
bmR3aWR0aCBieSByb3VnaGx5IDIwIHBlcmNlbnQgKERpc3BsYXlQb3J0KSBvciAxLjUgcGVyY2Vu
dCAoUENJCj4gRXhwcmVzcyBHZW4gMykiCgpUaGF0IGp1c3QgbWVhbnMgdGhlIGludGVybmFsIFRC
MyBsaW5rIG9ubHkgY2FycmllcyB0aGUgcGF5bG9hZCBkYXRhIGZyb20KdGhlIFBDSWUgbGluaywg
bm90IHRoZSAxLjUlIG9mIGJpdHMgdXNlZCBmb3IgdGhlIFBDSWUgZW5jb2RpbmcuIFRCMwpjYW5u
b3QgbWFnaWNhbGx5IG1ha2UgdGhlIFBDSWUgbGluayBpdHNlbGYgd29yayB3aXRob3V0IHRoZSBl
bmNvZGluZy4KCgotLSAKRWFydGhsaW5nIE1pY2hlbCBEw6RuemVyICAgICAgICAgICAgICAgfCAg
ICAgICAgICAgICAgaHR0cHM6Ly93d3cuYW1kLmNvbQpMaWJyZSBzb2Z0d2FyZSBlbnRodXNpYXN0
ICAgICAgICAgICAgIHwgICAgICAgICAgICAgTWVzYSBhbmQgWCBkZXZlbG9wZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
