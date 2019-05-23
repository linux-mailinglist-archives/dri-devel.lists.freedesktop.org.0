Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF82B448
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0189D4B;
	Mon, 27 May 2019 12:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A689E08
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 12:31:06 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 97A7A68AFE; Thu, 23 May 2019 14:30:41 +0200 (CEST)
Date: Thu, 23 May 2019 14:30:41 +0200
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/6] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20190523123041.GB15685@lst.de>
References: <20190523065013.2719D68B05@newverein.lst.de>
 <20190523065400.BD9EB68B05@newverein.lst.de>
 <20190523090540.nhxrjpz3scx6jt23@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523090540.nhxrjpz3scx6jt23@flea>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
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
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgMTE6MDU6NDBBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiA+ICtPcHRpb25hbCBwcm9wZXJ0aWVzOgo+ID4gKwo+ID4gKyAtIFZpZGVvIHBvcnRz
IGZvciBSR0IgaW5wdXQgYW5kIGVEUCBvdXRwdXQgdXNpbmcgdGhlIERUIGJpbmRpbmdzCj4gPiAr
ICAgZGVmaW5lZCBpbiBbMV0KPiAKPiBUaGUgb3V0cHV0IG5vZGUgY2FuIGJlIG9wdGlvbmFsLCBi
dXQgdGhlIGlucHV0IG9uZSBpcyBwcm9iYWJseSBnb2luZwo+IHRvIGJlIG5lZWRlZCBhbGwgdGhl
IHRpbWUsIHNpbmNlIG90aGVyd2lzZSB5b3Ugd29uJ3QgYmUgYWJsZSB0byBmaWxsCj4gdGhlIG91
dHB1dCBwb3J0IG9mIHRoZSB1cHN0cmVhbSBkZXZpY2UgaW4gdGhlIGdyYXBoLgoKSSBndWVzcyBz
by4gQSBzaWJsaW5nIHByb2R1Y3QgYnJpZWYgKGFueDk4MDQpCmh0dHBzOi8vd3d3LmFuYWxvZ2l4
LmNvbS9lbi90dGxjb252ZXJ0ZXJzYnJpZGdlcwpyZWZlcmVuY2VzIGl0IGFzCnwgTFZUVEwgdG8g
RGlzcGxheVBvcnQgMS4yIF90cmFuc21pdHRlcl8Kc28gaXQgd2lsbCBwcm9iYWJseSBhbHdheXMg
YmUgdXNlZCBvbiB0aGUgb3V0cHV0IHNpZGUuCgoJVG9yc3RlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
