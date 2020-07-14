Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827921F877
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 19:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE1D89E19;
	Tue, 14 Jul 2020 17:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 398 seconds by postgrey-1.36 at gabe;
 Tue, 14 Jul 2020 17:46:51 UTC
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A50389E19
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 17:46:51 +0000 (UTC)
Received: (qmail 16273 invoked by uid 1000); 14 Jul 2020 17:40:08 -0000
Message-ID: <20200714174008.16272.qmail@stuge.se>
Date: Tue, 14 Jul 2020 17:40:07 +0000
From: Peter Stuge <peter@stuge.se>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v3 0/6] Generic USB Display driver
References: <20200529175643.46094-1-noralf@tronnes.org>
 <20200709163235.360054-1-lkundrak@v3.sk>
 <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1280ec51-7528-b993-3110-f6c28e98832c@tronnes.org>
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

SGkgTm9yYWxmLAoKTm9yYWxmIFRyw7hubmVzIHdyb3RlOgo+IEkgd291bGQgbGlrZSB0byBrZWVw
IHRoZSBTRVRfQlVGRkVSIHJlcXVlc3Qgc2luY2UgaXQgd2lsbCBzZXJ2ZSBhcyBhCj4gc3luY2lu
ZyBwb2ludCBiZXR3ZWVuIHRoZSBob3N0IGFuZCB0aGUgZGV2aWNlLiBJJ20gbm8gVVNCIGV4cGVy
dCBidXQgSQo+IGFzc3VtZSB0aGF0IGEgYnVsayB0cmFuc2ZlciBjYW4gZmFpbCBoYWxmd2F5IHRo
cm91Z2ggYW5kIHJlc3VsdCBpbiB0aGUKPiBuZXh0IHVwZGF0ZSBzdGFydGluZyB3aGVyZSB0aGUg
cHJldmlvdXMgb25lIGZhaWxlZCBhbmQgdGh1cyB3cml0aW5nCj4gYmV5b25kIHRoZSBlbmQgb2Yg
dGhlIGRpc3BsYXkgYnVmZmVyLgoKVHJhbnNmZXJzIGVpdGhlciBzdWNjZWVkIGNvbXBsZXRlbHkg
KHBvc3NpYmx5IGFmdGVyIG1hbnkgcmV0cmllcyksCnRpbWUgb3V0IChhZnRlciB6ZXJvIG9yIG1v
cmUgdHJhbnNmZXJlZCBieXRlcykgb3IgZmFpbCBjYXRhc3Ryb3BoaWNhbGx5CihlLmcuIGZyb20g
ZGV2aWNlIGRpc2Nvbm5lY3QpLgoKSW4gYWxsIGNhc2VzLCB0aGUgZHJpdmVyIG9uIHRoZSBob3N0
IGtub3dzL2hhcyBhdmFpbGFibGUgaG93IG1hbnkgYnl0ZXMKd2VyZSBzdWNjZXNzZnVsbHkgdHJh
bnNmZXJlZC4KCgovL1BldGVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
