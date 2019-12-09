Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DD3116D42
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B6A89D63;
	Mon,  9 Dec 2019 12:42:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018D989D63
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:42:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59ECF99A;
 Mon,  9 Dec 2019 13:42:54 +0100 (CET)
Date: Mon, 9 Dec 2019 14:42:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm/omapdrm: Fix trivial spelling
Message-ID: <20191209124247.GA9158@pendragon.ideasonboard.com>
References: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575895374;
 bh=/9t9mMNVnhK6lsKXNF7d29UDyDocfEsogVfQyZV5F7w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wBYFQVYuT+sG5EF7nE8SZitZwb+yVda0U0e9HMavQmUuYMtIrKclIXkwNhGl3ktqQ
 aHHh/7IUKnvc85wHjSgBPjP/GQVXoN+CpfEM6tYC9oFWhdD1TXf3eNwnBucvUCRjxa
 Te9SFXw1mGi5aqXepT8rAIOKehPAkK/lbQ6Tf+d8=
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
Cc: Jiri Kosina <trivial@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR TI OMAP" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBNb24sIERlYyAwOSwgMjAx
OSBhdCAxMjozMzoxOVBNICswMDAwLCBLaWVyYW4gQmluZ2hhbSB3cm90ZToKPiBGaXggdHJpdmlh
bCBzcGVsbGluZyBpZGVudGlmaWVkIHdoaWxlIGV4YW1pbmluZyB0aGUgY29kZS4KPiAKPiAJcy9z
dXBwcnRlZC4vc3VwcG9ydGVkLi8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLaWVyYW4gQmluZ2hhbSA8
a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgoKUmV2aWV3ZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jIHwgMiArLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2NydGMuYwo+IGluZGV4IDNjNWRkYmYzMGU5Ny4uZmNlN2U5NDRhMjgwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMKPiBAQCAtODMxLDcgKzgzMSw3IEBAIHN0
cnVjdCBkcm1fY3J0YyAqb21hcF9jcnRjX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAg
CSAqIE9NQVBfRFNTX0NIQU5ORUxfRElHSVQuIFggc2VydmVyIGFzc3VtZXMgMjU2IGVsZW1lbnQg
Z2FtbWEKPiAgCSAqIHRhYmxlcyBzbyBsZXRzIHVzZSB0aGF0LiBTaXplIG9mIEhXIGdhbW1hIHRh
YmxlIGNhbiBiZQo+ICAJICogZXh0cmFjdGVkIHdpdGggZGlzcGNfbWdyX2dhbW1hX3NpemUoKS4g
SWYgaXQgcmV0dXJucyAwCj4gLQkgKiBnYW1tYSB0YWJsZSBpcyBub3Qgc3VwcHJ0ZWQuCj4gKwkg
KiBnYW1tYSB0YWJsZSBpcyBub3Qgc3VwcG9ydGVkLgo+ICAJICovCj4gIAlpZiAocHJpdi0+ZGlz
cGNfb3BzLT5tZ3JfZ2FtbWFfc2l6ZShwcml2LT5kaXNwYywgY2hhbm5lbCkpIHsKPiAgCQl1bnNp
Z25lZCBpbnQgZ2FtbWFfbHV0X3NpemUgPSAyNTY7CgotLSAKUmVnYXJkcywKCkxhdXJlbnQgUGlu
Y2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
