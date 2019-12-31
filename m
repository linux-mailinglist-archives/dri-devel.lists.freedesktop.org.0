Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A116512DBED
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 22:05:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5F8899DB;
	Tue, 31 Dec 2019 21:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8386E248
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 15:41:32 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2BBBAC0005;
 Tue, 31 Dec 2019 15:41:27 +0000 (UTC)
Date: Tue, 31 Dec 2019 16:41:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH v2 10/11] arm64: dts: rockchip: Add PX30 DSI DPHY
Message-ID: <20191231164125.2aaad2e2@xps13>
In-Reply-To: <10740878.zWD4iEhqxt@phil>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
 <20191224143900.23567-11-miquel.raynal@bootlin.com>
 <1796464.bE5sXyoQCg@phil> <10740878.zWD4iEhqxt@phil>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Dec 2019 21:04:21 +0000
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sCgpIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZSBvbiBUdWUs
IDMxIERlYyAyMDE5IDEzOjE0OjAyCiswMTAwOgoKPiBBbSBEaWVuc3RhZywgMzEuIERlemVtYmVy
IDIwMTksIDEyOjU2OjE0IENFVCBzY2hyaWViIEhlaWtvIFN0dWVibmVyOgo+ID4gQW0gRGllbnN0
YWcsIDI0LiBEZXplbWJlciAyMDE5LCAxNTozODo1OSBDRVQgc2NocmllYiBNaXF1ZWwgUmF5bmFs
OiAgCj4gPiA+IEFkZCB0aGUgUEhZIHdoaWNoIG91dHB1dHMgTUlQSSBEU0kgYW5kIExWRFMuCj4g
PiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPiAgCj4gPiAKPiA+IGFwcGxpZWQgZm9yIDUuNiAocGlja2VkIGVhcmx5IGR1ZSB0
byBpdCBiZWluZyBzaGFyZWQgYmV0d2VlbiBsdmRzIGFuZCBkc2kpICAKPiAKPiBhbmQgSSd2ZSBq
dXN0IGFkZGVkIHRoZSBWTyBwb3dlcmRvbWFpbiB0byB0aGUgZHNpLWRwaHkgbm9kZS4KPiAKPiBX
aGlsZSB0aGUgVFJNIGlzIG5vdCByZWFsbHkgZm9ydGhjb21pbmcgaW4gdGVsbGluZyBtZSBpZiB0
aGUgZHBoeSBuZWVkcwo+IHRoZSBwb3dlci1kb21haW4gYXMgd2VsbCwgdGhlIHZlbmRvciBrZXJu
ZWwgZG9lcywgc28gd2Ugc2hvdWxkIHByb2JhYmx5Cj4ganVzdCBmb2xsb3cgdGhlaXIgZXhhbXBs
ZSA7LSkgLgoKQWdyZWVkIQoKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
