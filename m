Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1291E07E9
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A236989F77;
	Mon, 25 May 2020 07:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 763EA89D46
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 22:06:49 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A0AD8100004;
 Sun, 24 May 2020 22:06:44 +0000 (UTC)
Date: Mon, 25 May 2020 00:06:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v4 4/5] dt: bindings: brcmnand: add v2.1 and v2.2 support
Message-ID: <20200525000643.4ed45a73@xps13>
In-Reply-To: <DB7PR03MB4604C2B50C013033D0CB95F8F5B20@DB7PR03MB4604.eurprd03.prod.outlook.com>
References: <20200522121524.4161539-5-noltari@gmail.com>
 <20200524192550.4559-1-miquel.raynal@bootlin.com>
 <20200524212740.08c2810f@xps13>
 <DB7PR03MB4604C2B50C013033D0CB95F8F5B20@DB7PR03MB4604.eurprd03.prod.outlook.com>
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "kdasu.kdev@gmail.com" <kdasu.kdev@gmail.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIFN1
biwgMjQgTWF5IDIwMjAKMjE6MTM6NDEgKzAwMDA6Cgo+IFRoYW5rcyBmb3IgbWVyZ2luZyB0aGUg
cGF0Y2hlcyA6KS4KPiAKPiBCVFcsIGlzIHRoZXJlIHNvbWV0aGluZyB3cm9uZyB3aXRoIHBhdGNo
IDU/Cj4gSSBjYW4gc2VlIHBhdGNoZXMgMS00IGFwcGxpZWQgaW4gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdC9sb2cvP2g9bmFuZC9u
ZXh0LCBidXQgSSBjYW7igJl0IHNlZSBwYXRjaCA1Lgo+IAoKRG9uZSA6KQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
