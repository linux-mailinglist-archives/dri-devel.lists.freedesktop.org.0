Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BA71E07B9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DBA89D53;
	Mon, 25 May 2020 07:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E8E89DE6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 19:27:44 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1F098240003;
 Sun, 24 May 2020 19:27:41 +0000 (UTC)
Date: Sun, 24 May 2020 21:27:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>,
 computersforpeace@gmail.com, kdasu.kdev@gmail.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 sumit.semwal@linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Message-ID: <20200524212740.08c2810f@xps13>
In-Reply-To: <20200524192550.4559-1-miquel.raynal@bootlin.com>
References: <20200522121524.4161539-5-noltari@gmail.com>
 <20200524192550.4559-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3RlIG9uIFN1biwg
MjQgTWF5IDIwMjAKMjE6MjU6NTAgKzAyMDA6Cgo+IE9uIEZyaSwgMjAyMC0wNS0yMiBhdCAxMjox
NToyMyBVVEMsID0/dXRmLTg/cT89QzM9ODFsdmFyb19GZXJuPUMzPUExbmRlel9Sb2phcz89IHdy
b3RlOgo+ID4gQWRkZWQgYnJjbSxicmNtbmFuZC12Mi4xIGFuZCBicmNtLGJyY21uYW5kLXYyLjIg
YXMgcG9zc2libGUgY29tcGF0aWJsZQo+ID4gc3RyaW5ncyB0byBzdXBwb3J0IGJyY21uYW5kIGNv
bnRyb2xsZXJzIHYyLjEgYW5kIHYyLjIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IMOBbHZhcm8g
RmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+Cj4gPiBBY2tlZC1ieTogRmxvcmlh
biBGYWluZWxsaSA8Zi5mYWluZWxsaUBnbWFpbC5jb20+ICAKPiAKPiBBcHBsaWVkIHRvIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQg
bmFuZC9uZXh0LCB0aGFua3MuCgpGWUkgSSB1cGRhdGVkIHRoZSBjb21taXQgbG9nOgpzL2R0OiBi
aW5kaW5nczovZHQtYmluZGluZ3M6IG10ZDovCnMvQWRkZWQvQWRkLwoKVGhhbmtzLApNaXF1w6hs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
