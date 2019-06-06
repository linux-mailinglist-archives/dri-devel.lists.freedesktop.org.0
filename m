Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA038537
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD818899F0;
	Fri,  7 Jun 2019 07:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04981892C2
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 08:51:15 +0000 (UTC)
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
 by kirsty.vergenet.net (Postfix) with ESMTPA id F417225B746;
 Thu,  6 Jun 2019 18:51:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
 id E8118E21A74; Thu,  6 Jun 2019 10:51:09 +0200 (CEST)
Date: Thu, 6 Jun 2019 10:51:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606075957.GF4931@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMDYsIDIwMTkgYXQgMTA6NTk6NTdBTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBTaW1vbiwKPiAKPiBPbiBNb24sIEp1biAwMywgMjAxOSBhdCAwMTo0MDo0
NVBNICswMjAwLCBTaW1vbiBIb3JtYW4gd3JvdGU6Cj4gPiBPbiBUdWUsIE1heSAyOCwgMjAxOSBh
dCAwNToxMjozMlBNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiBBZGQgdGhl
IG5ldyByZW5lc2FzLGNvbXBhbmlvbiBwcm9wZXJ0eSB0byB0aGUgTFZEUzAgbm9kZSB0byBwb2lu
dCB0byB0aGUKPiA+ID4gY29tcGFuaW9uIExWRFMgZW5jb2RlciBMVkRTMS4KPiA+ID4gCj4gPiA+
IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNh
c0BpZGVhc29uYm9hcmQuY29tPgo+ID4gPiBSZXZpZXdlZC1ieTogSmFjb3BvIE1vbmRpIDxqYWNv
cG8rcmVuZXNhc0BqbW9uZGkub3JnPgo+ID4gPiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFj
b3BvK3JlbmVzYXNAam1vbmRpLm9yZz4KPiA+IAo+ID4gSGkgTGF1cmVudCwKPiA+IAo+ID4gaXMg
dGhpcyBwYXRjaCByZWFkeSB0byBiZSBtZXJnZWQ/Cj4gCj4gSSB3YXMgaG9waW5nIGZvciBhbiBh
Y2sgZnJvbSB0aGUgRFQgYmluZGluZ3MgbWFpbnRhaW5lcnMgZm9yIHRoZQo+IGNvcnJlc3BvbmRp
bmcgYmluZGluZ3MgY2hhbmdlcywgYnV0IEkgd2FudCB0byBnZXQgdGhpcyBtZXJnZWQgZm9yIHRo
ZQo+IG5leHQga2VybmVsIHJlbGVhc2UsIHNvIEkgbWF5IG5vdCBnZXQgaXQuIEknbGwgcGluZyB5
b3Ugd2hlbiBJIHNlbmQgdGhlCj4gcHVsbCByZXF1ZXN0IGZvciB0aGUgRFQgYmluZGluZ3MgYW5k
IGRyaXZlcnMgY2hhbmdlcywgYXQgdGhhdCBwb2ludCB0aGlzCj4gcGF0Y2ggc2hvdWxkIGJlIHBp
Y2tlZCB1cC4KClRoYW5rcyBMYXVyZW50LCBnb3QgaXQuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
