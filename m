Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 344C6DCD20
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 19:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31DF6EB7E;
	Fri, 18 Oct 2019 17:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272B46EB7E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2019 17:56:20 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1iLWTo-00062R-Up; Fri, 18 Oct 2019 19:56:00 +0200
Message-ID: <07f370bfd62425c5472c1e423ae0b21b0789e5f5.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: etnaviv: Add #cooling-cells
From: Lucas Stach <l.stach@pengutronix.de>
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Abel Vesa <abel.vesa@nxp.com>, Anson Huang <Anson.Huang@nxp.com>, Carlo
 Caione <ccaione@baylibre.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Angus Ainslie (Purism)" <angus@akkea.ca>,  etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Date: Fri, 18 Oct 2019 19:55:56 +0200
In-Reply-To: <20191018135022.GA6728@bogon.m.sigxcpu.org>
References: <cover.1568255903.git.agx@sigxcpu.org>
 <6e9d761598b2361532146f43161fd05f3eee6545.1568255903.git.agx@sigxcpu.org>
 <20191018135022.GA6728@bogon.m.sigxcpu.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

T24gRnIsIDIwMTktMTAtMTggYXQgMTU6NTAgKzAyMDAsIEd1aWRvIEfDvG50aGVyIHdyb3RlOgo+
IEhpLAo+IE9uIFdlZCwgU2VwIDExLCAyMDE5IGF0IDA3OjQwOjM2UE0gLTA3MDAsIEd1aWRvIEfD
vG50aGVyIHdyb3RlOgo+ID4gQWRkICNjb29saW5nLWNlbGxzIGZvciB3aGVuIHRoZSBncHUgYWN0
cyBhcyBhIGNvb2xpbmcgZGV2aWNlLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdWlkbyBHw7xu
dGhlciA8YWd4QHNpZ3hjcHUub3JnPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9ldG5hdml2L2V0bmF2aXYtZHJtLnR4dCAgICAgICAgICB8IDEgKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50
eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5hdml2L2V0
bmF2aXYtZHJtLnR4dAo+ID4gaW5kZXggOGRlZjExYjE2YTI0Li42NDA1OTJlOGFiMmUgMTAwNjQ0
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9ldG5h
dml2L2V0bmF2aXYtZHJtLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvZXRuYXZpdi9ldG5hdml2LWRybS50eHQKPiA+IEBAIC0yMSw2ICsyMSw3
IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6Cj4gPiAgT3B0aW9uYWwgcHJvcGVydGllczoKPiA+ICAt
IHBvd2VyLWRvbWFpbnM6IGEgcG93ZXIgZG9tYWluIGNvbnN1bWVyIHNwZWNpZmllciBhY2NvcmRp
bmcgdG8KPiA+ICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dl
cl9kb21haW4udHh0Cj4gPiArLSAjY29vbGluZy1jZWxsczogOiBJZiB1c2VkIGFzIGEgY29vbGlu
ZyBkZXZpY2UsIG11c3QgYmUgPDI+Cj4gCj4gVGhlIG90aGVyIHBhdGNoIG9mIHRoZSBzZXJpZXMg
bWFkZSBpdCBpbnRvIGxpbnV4LW5leHQgYWxyZWFkeSBidXQgdGhpcwo+IGRvY3VtZW50YXRpb24g
Zml4dXAgZGlkbid0LiBBbnl0aGluZyBpIGNhbiBkbyB0byBnZXQgdGhpcyBhcHBsaWVkIGFzCj4g
d2VsbCBzbyBkb2N1bWVudGF0aW9uIHN0YXlzIGluIHN5bmM/CgpJJ3ZlIGFwcGxpZWQgYW5kIHB1
c2hlZCB0aGlzIHRvIG15IGV0bmF2aXYvbmV4dCBicmFuY2gganVzdCBub3csIHNvIGl0CnNob3Vs
ZCBzaG93IHVwIGluIGxpbnV4LW5leHQgcHJldHR5IHNvb24uCgpSZWdhcmRzLApMdWNhcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
