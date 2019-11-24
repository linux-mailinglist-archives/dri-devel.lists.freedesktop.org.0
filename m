Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87011089D4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A12F89FF6;
	Mon, 25 Nov 2019 08:08:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9A2189CF6
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 17:48:46 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 738CF80E4;
 Sun, 24 Nov 2019 17:49:18 +0000 (UTC)
Date: Sun, 24 Nov 2019 09:48:37 -0800
From: Tony Lindgren <tony@atomide.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 8/8] MIPS: DTS: jz4780: add sgx gpu node
Message-ID: <20191124174837.GX35479@atomide.com>
References: <cover.1574595627.git.hns@goldelico.com>
 <c73e2cee4f818654f264b0b7b5458bfaa0ac6a7a.1574595627.git.hns@goldelico.com>
 <1574600246.3.0@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574600246.3.0@crapouillou.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, Paul Burton <paulburton@kernel.org>,
 David Airlie <airlied@linux.ie>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 kernel@pyra-handheld.com, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 James Hogan <jhogan@kernel.org>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4gWzE5MTEyNCAxMjo1OF06Cj4g
TGUgZGltLiwgbm92LiAyNCwgMjAxOSBhdCAxMjo0MCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhu
c0Bnb2xkZWxpY28uY29tPiBhCj4gw6ljcml0IDoKPiA+IGFuZCBhZGQgaW50ZXJydXB0IGFuZCBj
bG9ja3MuCi4uLgo+ID4gLS0tIGEvYXJjaC9taXBzL2Jvb3QvZHRzL2luZ2VuaWMvano0NzgwLmR0
c2kKPiA+ICsrKyBiL2FyY2gvbWlwcy9ib290L2R0cy9pbmdlbmljL2p6NDc4MC5kdHNpCj4gPiBA
QCAtNDYsNiArNDYsMTcgQEAKPiA+ICAJCSNjbG9jay1jZWxscyA9IDwxPjsKPiA+ICAJfTsKPiA+
IAo+ID4gKwlncHU6IGdwdUAxMzA0MDAwMCB7Cj4gCj4gV2UgdHJ5IHRvIGtlZXAgdGhlIG5vZGVz
IG9yZGVyZWQgYnkgYWRkcmVzcywgY291bGQgeW91IG1vdmUgdGhpcyBub2RlIHdoZXJlCj4gaXQg
YmVsb25ncz8KLi4uCgo+ID4gKwkJY29tcGF0aWJsZSA9ICJpbmdlbmljLGp6NDc4MC1zZ3g1NDAt
MTIwIiwgImltZyxzZ3g1NDAtMTIwIiwKPiA+ICJpbWcsc2d4NTQwIiwgImltZyxzZ3g1IjsKPiA+
ICsJCXJlZyA9IDwweDEzMDQwMDAwIDB4NDAwMD47Cj4gPiArCj4gPiArCQljbG9ja3MgPSA8JmNn
dSBKWjQ3ODBfQ0xLX0dQVT47Cj4gPiArCQljbG9jay1uYW1lcyA9ICJncHUiOwoKSnVzdCBjaGVj
a2luZy4uIElzIHRoZXJlIHNvbWV0aGluZyBlbHNlIHRvIGNvbmZpZ3VyZSBoZXJlCnBvdGVudGlh
bGx5IGluIGFkZGl0aW9uIHRvIHRoZSBjbG9ja3M/CgpUaGF0IGlzLCBkbyB3ZSBuZWVkIHRvIGRv
IHNvbWUgaW50ZXJjb25uZWN0IHNwZWNpZmljCmNvbmZpZ3VyYXRpb24gZXRjIGluIGFkZGl0aW9u
IHRvIHRoZSBjbG9ja3MgdG8gaGF2ZQpydW50aW1lIFBNIHdvcmsgZm9yIGVuYWJsaW5nIGFuZCBk
aXNhYmxpbmcgc2d4IG9uCmp6NDc4MD8KClJlZ2FyZHMsCgpUb255Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
