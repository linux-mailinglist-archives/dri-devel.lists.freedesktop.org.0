Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77646178BC9
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C279C6EABF;
	Wed,  4 Mar 2020 07:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97456E44C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:47:17 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id 88C573A2E2F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 18:18:43 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A38CA200006;
 Tue,  3 Mar 2020 18:18:17 +0000 (UTC)
Date: Tue, 3 Mar 2020 19:18:16 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: mali-bifrost: Add Rockchip PX30
 compatible
Message-ID: <20200303191816.11dbc313@xps13>
In-Reply-To: <2766954.FXckbfHlGz@diego>
References: <20200302155808.11273-1-miquel.raynal@bootlin.com>
 <2766954.FXckbfHlGz@diego>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlIG9uIE1vbiwgMDIgTWFyIDIw
MjAgMTc6Mjk6MDIKKzAxMDA6Cgo+IEFtIE1vbnRhZywgMi4gTcOkcnogMjAyMCwgMTY6NTg6MDcg
Q0VUIHNjaHJpZWIgTWlxdWVsIFJheW5hbDoKPiA+IFJvY2tjaGlwIFBYMzAgU29DcyBmZWF0dXJl
IGEgQmlmcm9zdCBNYWxpIEdQVS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9ncHUvYXJtLG1hbGktYmlmcm9zdC55YW1sIHwgMSArICAKPiAK
PiBhbHJlYWR5IGluIG1haW5saW5lIDstKQo+IAo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPWFkODQ4
ZGQ1MzM4NWI2MWYzYzJiOTRkMzQ2NmJmNzk5ZjMxMDM1YTcKPiAKPiAKCllvdSBzaG91bGQgcHJv
YmFibHkgc2V0dXAgYW4gYXV0b21hdGljIGFuc3dlciA7KQoKSSBhZG1pdCB0aGF0IEkgd3JvdGUg
dGhlc2UgcGF0Y2hlcyBzb21lIHRpbWUgYWdvIHdoZW4gaXQgd2FzIG5vdCBpbgptYWlubGluZSBh
bmQgZGlkIG5vdCBjaGVjayBiZWZvcmUgc2VuZGluZyBpdCA6JAoKQ2hlZXJzLApNaXF1w6hsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
