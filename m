Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3534243361
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92E8892C6;
	Thu, 13 Jun 2019 07:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3B128933C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 11:52:54 +0000 (UTC)
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
 by kirsty.vergenet.net (Postfix) with ESMTPA id A27F025AD60;
 Wed, 12 Jun 2019 21:52:52 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
 id 98EDAE21FE5; Wed, 12 Jun 2019 13:52:50 +0200 (CEST)
Date: Wed, 12 Jun 2019 13:52:50 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190612115249.t4s5eebae6ospudm@verge.net.au>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
 <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
 <20190612102124.GJ5035@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190612102124.GJ5035@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:24 +0000
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

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMDE6MjE6MjRQTSArMDMwMCwgTGF1cmVudCBQaW5jaGFy
dCB3cm90ZToKPiBIaSBTaW1vbiwKPiAKPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBhdCAxMDo1MTow
OUFNICswMjAwLCBTaW1vbiBIb3JtYW4gd3JvdGU6Cj4gPiBPbiBUaHUsIEp1biAwNiwgMjAxOSBh
dCAxMDo1OTo1N0FNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4gPiBPbiBNb24s
IEp1biAwMywgMjAxOSBhdCAwMTo0MDo0NVBNICswMjAwLCBTaW1vbiBIb3JtYW4gd3JvdGU6Cj4g
PiA+PiBPbiBUdWUsIE1heSAyOCwgMjAxOSBhdCAwNToxMjozMlBNICswMzAwLCBMYXVyZW50IFBp
bmNoYXJ0IHdyb3RlOgo+ID4gPj4+IEFkZCB0aGUgbmV3IHJlbmVzYXMsY29tcGFuaW9uIHByb3Bl
cnR5IHRvIHRoZSBMVkRTMCBub2RlIHRvIHBvaW50IHRvIHRoZQo+ID4gPj4+IGNvbXBhbmlvbiBM
VkRTIGVuY29kZXIgTFZEUzEuCj4gPiA+Pj4gCj4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogTGF1cmVu
dCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4g
PiA+Pj4gUmV2aWV3ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9y
Zz4KPiA+ID4+PiBUZXN0ZWQtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRp
Lm9yZz4KPiA+ID4+IAo+ID4gPj4gSGkgTGF1cmVudCwKPiA+ID4+IAo+ID4gPj4gaXMgdGhpcyBw
YXRjaCByZWFkeSB0byBiZSBtZXJnZWQ/Cj4gPiA+IAo+ID4gPiBJIHdhcyBob3BpbmcgZm9yIGFu
IGFjayBmcm9tIHRoZSBEVCBiaW5kaW5ncyBtYWludGFpbmVycyBmb3IgdGhlCj4gPiA+IGNvcnJl
c3BvbmRpbmcgYmluZGluZ3MgY2hhbmdlcywgYnV0IEkgd2FudCB0byBnZXQgdGhpcyBtZXJnZWQg
Zm9yIHRoZQo+ID4gPiBuZXh0IGtlcm5lbCByZWxlYXNlLCBzbyBJIG1heSBub3QgZ2V0IGl0LiBJ
J2xsIHBpbmcgeW91IHdoZW4gSSBzZW5kIHRoZQo+ID4gPiBwdWxsIHJlcXVlc3QgZm9yIHRoZSBE
VCBiaW5kaW5ncyBhbmQgZHJpdmVycyBjaGFuZ2VzLCBhdCB0aGF0IHBvaW50IHRoaXMKPiA+ID4g
cGF0Y2ggc2hvdWxkIGJlIHBpY2tlZCB1cC4KPiA+IAo+ID4gVGhhbmtzIExhdXJlbnQsIGdvdCBp
dC4KPiAKPiBUaGUgRFQgYmluZGluZ3MgYW5kIGRyaXZlciBjaGFuZ2VzIGhhdmUgYmVlbiBtZXJn
ZWQsIHNvIHBsZWFzZSBnbyBhaGVhZAo+IGFuZCBwaWNrIHRoaXMgcGF0Y2ggZm9yIHY1LjMuCgpU
aGFua3MgTGF1cmVudCwKCmRvbmUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
