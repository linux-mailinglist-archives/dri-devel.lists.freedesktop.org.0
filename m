Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 247C021FD7D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 21:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1646E83F;
	Tue, 14 Jul 2020 19:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A86B6E842
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 19:38:44 +0000 (UTC)
Received: (qmail 18495 invoked by uid 1000); 14 Jul 2020 19:38:41 -0000
Message-ID: <20200714193841.18494.qmail@stuge.se>
Date: Tue, 14 Jul 2020 19:38:41 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
 <20200714174008.16272.qmail@stuge.se>
 <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <befd06f1-d0cc-ab26-3ec1-5da3f3ab3f37@tronnes.org>
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
Cc: Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org, balbi@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+ID4gSW4gYWxsIGNhc2VzLCB0aGUgZHJpdmVyIG9uIHRo
ZSBob3N0IGtub3dzL2hhcyBhdmFpbGFibGUgaG93IG1hbnkgYnl0ZXMKPiA+IHdlcmUgc3VjY2Vz
c2Z1bGx5IHRyYW5zZmVyZWQuCj4gCj4gSSB3YXMgdGhpbmtpbmcgYWJvdXQgdGhlIGRldmljZSwg
dGhhdCBpdCBjb3VsZCBnZXQgb3V0IG9mIHN5bmMuIExldCdzCj4gc2F5IHRoZSBob3N0IHNlbmRz
IGEgMWsgZnJhbWVidWZmZXIgYW5kIGhhbGYgb2YgaXQgZ2V0cyB0cmFuc2ZlcnJlZCBhbmQKPiB0
aGUgcmVzdCBmYWlscyBmb3Igc29tZSByZWFzb24uIEx1Ym9taXIncyBNQ1UgaW1wbGVtZW50YXRp
b24gaGFzIGFuCj4gZW5kcG9pbnQgbWF4IHNpemUgb2YgNjQgYnl0ZXMgYW5kIGEgY2FsbGJhY2sg
aXMgY2FsbGVkIGZvciBlYWNoIHBhY2tldC4KPiBJZiB0aGUgMWsgdHJhbnNmZXIgZmFpbHMgYXQg
c29tZSBwb2ludCwgd2lsbCB0aGUgZGV2aWNlIGJlIGFibGUgdG8KPiBkZXRlY3QgdGhpcyBhbmQg
a25vdyB0aGF0IHRoZSBuZXh0IHRpbWUgdGhlIHJ4IGNhbGxiYWNrIGlzIGNhbGxlZCB0aGF0Cj4g
dGhpcyBpcyB0aGUgc3RhcnQgb2YgYSBuZXcgZnJhbWVidWZmZXIgdXBkYXRlPwoKQWghIE5vLCBh
IGRldmljZSBjYW4gbm90IGRldGVjdCB0aGF0IHRoZSBob3N0IGludGVuZGVkIHRvIHNlbmQgbW9y
ZSAoYnVsaykKcGFja2V0cyBidXQgZS5nLiB0aW1lZCBvdXQuCgpJIGNhbid0IGltbWVkaWF0ZWx5
IHRoaW5rIG9mIG90aGVyIHJlYXNvbnMgZm9yIGEgbGFyZ2VyIHRyYW5zZmVyIHRvIGZhaWwsCndo
aWNoIHN0aWxsIGFsbG93IGNvbW11bmljYXRpb24gdG8gY29udGludWUuCgpXaGVuIHRoZSBob3N0
IHJlY29nbml6ZXMgYSB0aW1lb3V0IHdpdGggcGFydGlhbCBkYXRhIHRyYW5zZmVyIGl0IGNvdWxk
CnNpbXBseSBzZW5kIHRoZSByZW1haW5pbmcgZGF0YSBpbiBhIG5ldyB0cmFuc2Zlci4KCgpXaGls
ZSB0aGUgZGV2aWNlIGNhbiBub3QgZGV0ZWN0IGhvc3QgaW50ZW50LCB0aGUgcHJvdG9jb2wgY291
bGQgYWxsb3cKZGV2aWNlcyB0byBzcGVjaWZ5IHJlcXVpcmVtZW50cywgZS5nLiB0aGF0IHRoZSBo
b3N0IGFsd2F5cyBzZW5kcyBmdWxsIGZyYW1lcy4KCkluIGFueSBjYXNlLCBwbGVhc2UgYXZvaWQg
bWFraW5nIGEgY29udHJvbCByZXF1ZXN0IG1hbmRhdG9yeSBmb3IgZnJhbWUKdHJhbnNmZXIuCgpC
ZWNhdXNlIGNvbnRyb2wgcmVxdWVzdHMgYXJlIHNjaGVkdWxlZCBkaWZmZXJlbnRseSBvbnRvIHRo
ZSB3aXJlIGFuZApiZWNhdXNlIHRoZXkgY29uc2lzdCBvZiBtb3JlIHBhY2tldHMgdGhhbiBidWxr
IGRhdGEsIGEgY29udHJvbCByZXF1ZXN0CndpbGwgaW50ZXJydXB0IGEgYnVsayBkYXRhIHN0cmVh
bSBhbmQgbGlrZWx5IGludHJvZHVjZSB1bm5lY2Nlc3NhcnkgbGF0ZW5jeS4KCklmIHN5bmNocm9u
aXphdGlvbiBpcyBhbHdheXMgcmVxdWlyZWQgdGhlbiBJJ2Qgc3VnZ2VzdCB0byBwbGFjZSBpdCBp
bmxpbmUKd2l0aCBmcmFtZSBkYXRhLCBlLmcuIGluIHRoZSBmaXJzdCBwYWNrZXQgYnl0ZS4KCklm
IHN5bmNocm9uaXphdGlvbiBpcyBvbmx5IHJlcXVpcmVkIGluIHJhcmUgY2FzZXMgdGhlbiBhIGNv
bnRyb2wgdHJhbnNmZXIKaXMgcHJvYmFibHkgdGhlIGJldHRlciBjaG9pY2UsIHRvIG5vdCB3YXN0
ZSBhbnkgaW5saW5lIGJ5dGVzLgoKQnV0IHRoZSBvcHRpbXVtIHdvdWxkIGJlIHRoYXQgdGhlIGRl
dmljZSBjYW4gZGVzY3JpYmUgaXRzIG5lZWRzIHRvIHRoZSBob3N0CmFuZCB0aGUgaG9zdCBkcml2
ZXIgZW5zdXJlcyB0aGF0IHRoZSBkZXZpY2UgYWx3YXlzIHJlY2VpdmVzIHRoZSBkYXRhIGl0IG5l
ZWRzLgoKRG8geW91IHRoaW5rIHRoaXMgaXMgcG9zc2libGU/CgoKS2luZCByZWdhcmRzCgovL1Bl
dGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
