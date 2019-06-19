Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0555C4BC2C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CE26E42B;
	Wed, 19 Jun 2019 14:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DAFC6E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:51:30 +0000 (UTC)
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
 by kirsty.vergenet.net (Postfix) with ESMTPA id F035D25B262;
 Wed, 19 Jun 2019 23:51:27 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
 id 049D59409FF; Wed, 19 Jun 2019 15:51:25 +0200 (CEST)
Date: Wed, 19 Jun 2019 15:51:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Message-ID: <20190619135123.jym5j6qtgxq23dec@verge.net.au>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190618164338.GG21105@pendragon.ideasonboard.com>
 <TY1PR01MB1770E12DBC116A3F395DE17BC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770E12DBC116A3F395DE17BC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDg6MDg6MDlBTSArMDAwMCwgRmFicml6aW8gQ2FzdHJv
IHdyb3RlOgo+IEhpIExhdXJlbnQsCj4gCj4gVGhhbmsgeW91IGZvciB5b3VyIGZlZWRiYWNrIQo+
IAo+ID4gRnJvbTogbGludXgtcmVuZXNhcy1zb2Mtb3duZXJAdmdlci5rZXJuZWwub3JnIDxsaW51
eC1yZW5lc2FzLXNvYy1vd25lckB2Z2VyLmtlcm5lbC5vcmc+IE9uIEJlaGFsZiBPZiBMYXVyZW50
IFBpbmNoYXJ0Cj4gPiBTZW50OiAxOCBKdW5lIDIwMTkgMTc6NDQKPiA+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMS8zXSBkdC1iaW5kaW5nczogZGlzcGxheTogcmVuZXNhczogQWRkIHI4YTc3NGExIHN1
cHBvcnQKPiA+IAo+ID4gSGkgRmFicml6aW8sCj4gPiAKPiA+IFRoYW5rIHlvdSBmb3IgdGhlIHBh
dGNoLgo+ID4gCj4gPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAwNDoxODozN1BNICswMTAwLCBG
YWJyaXppbyBDYXN0cm8gd3JvdGU6Cj4gPiA+IERvY3VtZW50IFJaL0cyTSAoUjhBNzc0QTEpIFNv
QyBiaW5kaW5ncy4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxm
YWJyaXppby5jYXN0cm9AYnAucmVuZXNhcy5jb20+Cj4gPiAKPiA+IFJldmlld2VkLWJ5OiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiAKPiA+
IEkgZG9uJ3QgaGF2ZSBwZW5kaW5nIGNoYW5nZXMgZm9yIHRoaXMgZmlsZSBmb3IgdGhpcyBrZXJu
ZWwgcmVsZWFzZS4gQXMKPiA+IHlvdXIgc2VyaWVzIGNvbnRhaW5zIERUIGNoYW5nZXMsIEknbSBm
aW5lIGlmIHRoaXMgcGF0Y2ggZ2V0cyBtZXJnZWQKPiA+IHRocm91Z2ggdGhlIEFSTSBTb0MgdHJl
ZSBhbG9uZyB3aXRoIHRoZSByZXN0LiBPdGhlcndpc2UgcGxlYXNlIGxldCBtZQo+ID4ga25vdyBp
ZiBJIHNob3VsZCBoYW5kbGUgaXQgbXlzZWxmLgo+IAo+IFRoYW5rIHlvdSBMYXVyZW50LCBJIHRo
aW5rIHRoaXMgcGF0Y2ggY2FuIGdvIGFsb25nIHdpdGggdGhlIHJlc3QsIGlmIHRoYXQncyBPSyB3
aXRoCj4gU2ltb24/CgpUaGFua3MsCgpJJ3ZlIHF1ZXVlZCB0aGlzIHVwIGluIHRoZSByZW5lc2Fz
IHRyZWUgZm9yIGluY2x1c2lvbiBpbiB2NS4zLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
