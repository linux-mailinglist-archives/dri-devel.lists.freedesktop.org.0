Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B7EDC677
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 15:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1147389B78;
	Fri, 18 Oct 2019 13:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA9B6EB52
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 13:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 27700FB04;
 Fri, 18 Oct 2019 15:50:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TA8MpUsK2edw; Fri, 18 Oct 2019 15:50:23 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id B98DB49A41; Fri, 18 Oct 2019 15:50:22 +0200 (CEST)
Date: Fri, 18 Oct 2019 15:50:22 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: "To : Lucas Stach" <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Carlo Caione <ccaione@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
Message-ID: <20191018135022.GA6728@bogon.m.sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFdlZCwgU2VwIDExLCAyMDE5IGF0IDA3OjQwOjM2UE0gLTA3MDAsIEd1aWRvIEfDvG50
aGVyIHdyb3RlOgo+IEFkZCAjY29vbGluZy1jZWxscyBmb3Igd2hlbiB0aGUgZ3B1IGFjdHMgYXMg
YSBjb29saW5nIGRldmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4
QHNpZ3hjcHUub3JnPgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2V0
bmF2aXYvZXRuYXZpdi1kcm0udHh0ICAgICAgICAgIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2V0bmF2aXYvZXRuYXZpdi1kcm0udHh0Cj4gaW5k
ZXggOGRlZjExYjE2YTI0Li42NDA1OTJlOGFiMmUgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50eHQKPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0
bmF2aXYtZHJtLnR4dAo+IEBAIC0yMSw2ICsyMSw3IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4g
IE9wdGlvbmFsIHByb3BlcnRpZXM6Cj4gIC0gcG93ZXItZG9tYWluczogYSBwb3dlciBkb21haW4g
Y29uc3VtZXIgc3BlY2lmaWVyIGFjY29yZGluZyB0bwo+ICAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0Cj4gKy0gI2Nvb2xpbmctY2VsbHM6
IDogSWYgdXNlZCBhcyBhIGNvb2xpbmcgZGV2aWNlLCBtdXN0IGJlIDwyPgoKVGhlIG90aGVyIHBh
dGNoIG9mIHRoZSBzZXJpZXMgbWFkZSBpdCBpbnRvIGxpbnV4LW5leHQgYWxyZWFkeSBidXQgdGhp
cwpkb2N1bWVudGF0aW9uIGZpeHVwIGRpZG4ndC4gQW55dGhpbmcgaSBjYW4gZG8gdG8gZ2V0IHRo
aXMgYXBwbGllZCBhcwp3ZWxsIHNvIGRvY3VtZW50YXRpb24gc3RheXMgaW4gc3luYz8KQ2hlZXJz
LAogLS0gR3VpZG8KCj4gIAo+ICBleGFtcGxlOgo+ICAKPiAtLSAKPiAyLjIzLjAucmMxCj4gCj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51
eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYXJtLWtlcm5lbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
