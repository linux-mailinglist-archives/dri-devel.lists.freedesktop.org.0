Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F21E02AF
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 22:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 215A489DA5;
	Sun, 24 May 2020 20:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A9F89DA5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds201912;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sq5GWwxs0JdhOPrdQJIiKQa11Coj5e2lXziQNAEDCV0=; b=L4kqhggSoNZjBNc6hYvjpvuCjD
 Cf1OOhe6q176hHE8T0hur5jr0s0KMxGzEdo1bLvsP+3cssSsuTOVbP3TIz3cGVcr+jNs+B6I3glnD
 TF3h6dJamFbzD8yTKyclAzl/ozn1DG3oPbZYwLfNsotIiN1e3uPQHo43T9KwXofwJP6I5DmZOKqIw
 cb5dSWSzR0erLk1HDaA9PR7vkfxtelxN7aNv7PGpzcp+QBiPU4/YBWcRlbEHVYhCUmD1Ws73fpith
 1PPr3qUNoBdiUBJLf9h8T3BytRjRntKySYMgcZjjmJfQ836RsVr4uFakbPuh2i2zPs+tp2l6HCkwz
 UTlFhFHw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52182
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1jcx0f-0001AI-0T; Sun, 24 May 2020 22:14:13 +0200
Subject: Re: MIPI DSI, DBI, and tinydrm drivers
To: Paul Cercueil <paul@crapouillou.net>
References: <4QFUAQ.UPWBIKSUSOG@crapouillou.net>
 <05f4908a-2df4-2694-e5e6-0faee31cc2a9@tronnes.org>
 <3YPUAQ.ALFWN74JD6DR1@crapouillou.net>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0f860795-218e-b9f0-0d1c-699024d3cc9a@tronnes.org>
Date: Sun, 24 May 2020 22:14:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3YPUAQ.ALFWN74JD6DR1@crapouillou.net>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjQuMDUuMjAyMCAyMS41NCwgc2tyZXYgUGF1bCBDZXJjdWVpbDoKPiBIaSBOb3JhbGYs
Cj4gCj4gTGUgZGltLiAyNCBtYWkgMjAyMCDDoCAxOTo0NiwgTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+IGEgw6ljcml0IDoKPj4KPj4KPj4gRGVuIDI0LjA1LjIwMjAgMTguMTMs
IHNrcmV2IFBhdWwgQ2VyY3VlaWw6Cj4+PiDCoEhpIGxpc3QsCj4+Pgo+Pj4gwqBJJ2QgbGlrZSB0
byBvcGVuIGEgZGlzY3Vzc2lvbiBhYm91dCB0aGUgY3VycmVudCBzdXBwb3J0IG9mIE1JUEkgRFNJ
IGFuZAo+Pj4gwqBEQkkgcGFuZWxzLgo+Pj4KPj4+IMKgQm90aCBhcmUgc3RhbmRhcmRzIGZyb20g
dGhlIE1JUEkgYWxsaWFuY2UsIGJvdGggYXJlIGNvbW11bmljYXRpb24KPj4+IMKgcHJvdG9jb2xz
IGJldHdlZW4gYSBMQ0QgY29udHJvbGxlciBhbmQgYSBMQ0QgcGFuZWwsIHRoZXkgZ2VuZXJhbGx5
IGJvdGgKPj4+IMKgdXNlIHRoZSBzYW1lIGNvbW1hbmRzIChEQ1MpLCB0aGUgbWFpbiBkaWZmZXJl
bmNlIGlzIHRoYXQgRFNJIGlzIHNlcmlhbAo+Pj4gwqBhbmQgREJJIGlzIGdlbmVyYWxseSBwYXJh
bGxlbC4KPj4+Cj4+PiDCoEluIHRoZSBrZXJuZWwgcmlnaHQgbm93LCBEU0kgaXMgcHJldHR5IHdl
bGwgaW1wbGVtZW50ZWQuIEFsbCB0aGUKPj4+IMKgaW5mcmFzdHVjdHVyZSB0byByZWdpc3RlciBh
IERTSSBob3N0LCBEU0kgZGV2aWNlIGV0Yy4gaXMgdGhlcmUuIERTSQo+Pj4gwqBwYW5lbHMgYXJl
IGltcGxlbWVudGVkIGFzIHJlZ3VsYXIgZHJtX3BhbmVsIGluc3RhbmNlcywgYW5kIHRoZWlyCj4+
PiBkcml2ZXJzCj4+PiDCoGdvIHRocm91Z2ggdGhlIERTSSBBUEkgdG8gY29tbXVuaWNhdGUgd2l0
aCB0aGUgcGFuZWwsIHdoaWNoIG1ha2VzIHRoZW0KPj4+IMKgaW5kZXBlbmRlbnQgb2YgdGhlIERT
SSBob3N0IGRyaXZlci4KPj4+Cj4+PiDCoERCSSwgb24gdGhlIG90aGVyIGhhbmQsIGRvZXMgbm90
IGhhdmUgYW55IG9mIHRoaXMuIEFsbCAoPykgREJJIHBhbmVscwo+Pj4gwqBhcmUgaW1wbGVtZW50
ZWQgYXMgdGlueWRybSBkcml2ZXJzLCB3aGljaCBtYWtlIHRoZW0gaW1wb3NzaWJsZSB0byB1c2UK
Pj4+IMKgd2l0aCByZWd1bGFyIERSTSBkcml2ZXJzLiBXcml0aW5nIGEgc3RhbmRhcmQgZHJtX3Bh
bmVsIGRyaXZlciBpcwo+Pj4gwqBpbXBvc3NpYmxlLCBhcyB0aGVyZSBpcyBubyBjb25jZXB0IG9m
IGhvc3QgYW5kIGRldmljZS4gQWxsIHRoZXNlCj4+PiB0aW55ZHJtCj4+PiDCoGRyaXZlcnMgcmVn
aXN0ZXIgdGhlaXIgb3duIERCSSBob3N0IGFzIHRoZXkgYWxsIGRvIERCSSBvdmVyIFNQSS4KPj4+
Cj4+PiDCoEkgdGhpbmsgdGhpcyBuZWVkcyBhIGdvb2QgY2xlYW51cC4gR2l2ZW4gdGhhdCBEU0kg
YW5kIERCSSBhcmUgc28KPj4+IMKgc2ltaWxhciwgaXQgd291bGQgcHJvYmFibHkgbWFrZSBzZW5z
ZSB0byBmdXNlIERCSSBzdXBwb3J0IGludG8gdGhlCj4+PiDCoGN1cnJlbnQgRFNJIGNvZGUsIGFz
IHRyeWluZyB0byB1cGRhdGUgREJJIHdvdWxkIHJlc3VsdCBpbiBhIGxvdCBvZiBjb2RlCj4+PiDC
oGJlaW5nIGR1cGxpY2F0ZWQuIFdpdGggdGhlIHByb3BlciBob3N0L2RldmljZSByZWdpc3RyYXRp
b24gbWVjaGFuaXNtCj4+PiDCoGZyb20gRFNJIGNvZGUsIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRv
IHR1cm4gbW9zdCBvZiB0aGUgdGlueWRybSBkcml2ZXJzCj4+PiDCoGludG8gcmVndWxhciBkcm1f
cGFuZWwgZHJpdmVycy4KPj4+Cj4+PiDCoFRoZSBwcm9ibGVtIHRoZW4gaXMgdGhhdCB0aGVzZSBz
aG91bGQgc3RpbGwgYmUgYXZhaWxhYmxlIGFzIHRpbnlkcm0KPj4+IMKgZHJpdmVycy4gSWYgdGhl
IERTSS9EQkkgcGFuZWxzIGNhbiBzb21laG93IHJlZ2lzdGVyIGEgLnVwZGF0ZV9mYigpCj4+PiDC
oGNhbGxiYWNrLCBpdCB3b3VsZCBtYWtlIGl0IHBvc3NpYmxlIHRvIGhhdmUgYSBwYW5lbC1hZ25v
c3RpYyB0aW55ZHJtCj4+PiDCoGRyaXZlciwgd2hpY2ggd291bGQgdGhlbiBwcm9iYWJseSBvcGVu
IGEgbG90IG9mIGRvb3JzLCBhbmQgaGVscCBhCj4+PiBsb3QgdG8KPj4+IMKgY2xlYW4gdGhlIG1l
c3MuCj4+Pgo+Pj4gwqBJIHRoaW5rIEkgY2FuIGhlbHAgd2l0aCB0aGF0LCBJIGp1c3QgbmVlZCBz
b21lIGd1aWRhbmNlIC0gSSBhbSBmaXNoaW5nCj4+PiDCoGluIGV4b3RpYyBzZWFzIGhlcmUuCj4+
Pgo+Pj4gwqBUaG91Z2h0cywgY29tbWVudHMsIGFyZSB2ZXJ5IHdlbGNvbWUuCj4+Cj4+IEkgZGlk
IGxvb2sgYXQgdGhpcyBhIGZldyBtb250aHMgYmFjazoKPj4KPj4gZHJtL21pcGktZGJpOiBTdXBw
b3J0IHBhbmVsIGRyaXZlcnMKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2
ZXMvZHJpLWRldmVsLzIwMTktQXVndXN0LzIyODk2Ni5odG1sCj4+Cj4+IFRoZSBwcm9ibGVtIHdp
dGggREJJIGlzIHRoYXQgaXQgaGFzIHJldXNlZCBvdGhlciBidXNzZXMgd2hpY2ggbWVhbnMgd2UK
Pj4gZG9uJ3QgaGF2ZSBEQkkgZHJpdmVycywgd2UgaGF2ZSBTUEkgZHJpdmVycyBpbnN0ZWFkICg2
ODAwLzgwODAgaXMgbm90Cj4+IGF2YWlsLiBhcyBidXNzZXMgaW4gTGludXggeWV0KS4gRFNJIGFu
ZCBEUEkgb24gdGhlIG90aGVyIGhhbmQgaGFzCj4+IGRlZGljYXRlZCBodyBjb250cm9sbGVyIGRy
aXZlcnMgbm90IHNoYXJlZCB3aXRoIG90aGVyIHN1YnN5c3RlbXMuCj4gCj4gSSBkb24ndCB0aGlu
ayB0aGF0IHNob3VsZCBiZSBtdWNoIG9mIGEgcHJvYmxlbS4gWW91IGNvdWxkIGhhdmUgYSBEQkkv
U1BJCj4gYnJpZGdlLCB0aGF0IHdyYXBzIGEgU1BJIGRldmljZSBpbnRvIGEgREJJIGhvc3QsIGZv
ciBpbnN0YW5jZS4gVGhlIHBhbmVsCj4gZHJpdmVycyB3b3VsZCBqdXN0IHVzZSB0aGUgREJJIEFQ
SSB3aXRob3V0IGhhdmluZyB0byBrbm93IHdoYXQncyBkb25lCj4gYmVoaW5kIHRoZSBzY2VuZS4K
ClRoaXMgd2lsbCBiZSBhIGJyaWRnZSBpbXBsZW1lbnRlZCBpbiBzb2Z0d2FyZSwgYXJlIHdlIGFs
bG93ZWQgdG8gaGF2ZQpzb2Z0d2FyZSBkZXZpY2VzIGluIHRoZSBEZXZpY2UgVHJlZT8gSSB0aG91
Z2ggaXQgd2FzIGp1c3QgYWxsb3dlZCB0bwpkZXNjcmliZSBoYXJkd2FyZS4KCk5vcmFsZi4KCj4g
Cj4gQ2hlZXJzLAo+IC1QYXVsCj4gCj4+IE15IGluaXRpYWwgdGlueWRybSB3b3JrIHVzZWQgZHJt
X3BhbmVsLCBidXQgSSB3YXMgbm90IGFsbG93ZWQgdG8gdXNlIGl0Cj4+IChhdCBsZWFzdCBub3Qg
dGhlIHdheSBJIGhhZCBkb25lIGl0KS4KPj4KPj4gTm9yYWxmLgo+Pgo+Pj4KPj4+IMKgQ2hlZXJz
LAo+Pj4gwqAtUGF1bAo+Pj4KPj4+Cj4gCj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
