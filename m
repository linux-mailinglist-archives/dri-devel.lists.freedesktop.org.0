Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5663910FDCD
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 13:38:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9910B6E4A7;
	Tue,  3 Dec 2019 12:38:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C46D6E4A7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 12:38:49 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6133E28DB93;
 Tue,  3 Dec 2019 12:38:47 +0000 (GMT)
Date: Tue, 3 Dec 2019 13:38:43 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 17/21] dt-bindings: display: bridge:
 lvds-transmitter: Add new props
Message-ID: <20191203133843.32cab43e@collabora.com>
In-Reply-To: <20191202171140.GR4929@pendragon.ideasonboard.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <20191023154512.9762-18-boris.brezillon@collabora.com>
 <20191202171140.GR4929@pendragon.ideasonboard.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Chris Healy <cphealy@gmail.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyIERlYyAyMDE5IDE5OjExOjQwICswMjAwCkxhdXJlbnQgUGluY2hhcnQgPGxhdXJl
bnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4gd3JvdGU6Cgo+IEhpIEJvcmlzLAo+IAo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIFdlZCwgT2N0IDIzLCAyMDE5IGF0IDA1OjQ1
OjA4UE0gKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IEFkZCB0aGUgZGF0YS1tYXBw
aW5nIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBvdXRwdXQgYnVzIGZvcm1hdCBhbmQKPiA+IHRo
ZSBidXMtd2lkdGggcHJvcGVydHkgdG8gZGVzY3JpYmUgdGhlIGlucHV0IGJ1cyBmb3JtYXQuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNv
bGxhYm9yYS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMgaW4gdjM6Cj4gPiAqIE5ldyBwYXRjaAo+
ID4gLS0tCj4gPiAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIu
dHh0ICAgIHwgMTMgKysrKysrKysrKysrKyAgCj4gCj4gUGxlYXNlIG5vdGUgdGhhdCBsdmRzLXRy
YW5zbWl0dGVyIGhhcyBiZWVuIHJlbmFtZWQgdG8gbHZkcy1jb2RlYyBhbmQKPiBjb252ZXJ0ZWQg
dG8gWUFNTCBhcyBwYXJ0IG9mIGEgcHVsbCByZXF1ZXN0IEkndmUgcmVjZW50bHkgc2VudCAoWzFd
KS4KPiBUaGlzIHBhdGNoIHdpbGwgdGh1cyBuZWVkIHRvIGJlIHJlYmFzZWQuCgpMZXQgbWUga25v
dyB3aGVuIGl0J3MgYmVlbiBtZXJnZWQsIEknbGwgYXNrIGZvciBhIGRybS1uZXh0IC0+CmRybS1t
aXNjLW5leHQgYmFja21lcmdlLgoKPiAKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0
b3Aub3JnL3BhdGNoLzM0Mjc1NC8KPiAKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9u
cygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0Cj4g
PiBpbmRleCA2MDA5MWRiNWRmYTUuLjdiNDNiNmYyMDI3OSAxMDA2NDQKPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5zbWl0
dGVyLnR4dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIudHh0Cj4gPiBAQCAtMzYsNiArMzYsMTkgQEAgZ3Jh
cGggYmluZGluZ3Mgc3BlY2lmaWVkIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncmFwaC50eHQuCj4gPiAgLSBWaWRlbyBwb3J0IDAgZm9yIHBhcmFsbGVsIGlucHV0Cj4gPiAg
LSBWaWRlbyBwb3J0IDEgZm9yIExWRFMgb3V0cHV0Cj4gPiAgCj4gPiArT3B0aW9uYWwgcG9ydCAw
IG5vZGUgcHJvcGVydGllczoKPiA+ICsKPiA+ICstIGJ1cy13aWR0aDogbnVtYmVyIG9mIGRhdGEg
bGluZXMgdXNlIHRvIHRyYW5zbWl0IHRoZSBSR0IgZGF0YS4KPiA+ICsJICAgICBDYW4gYmUgMTgg
b3IgMjQuCj4gPiArCj4gPiArT3B0aW9uYWwgcG9ydCAxIG5vZGUgcHJvcGVydGllczoKPiA+ICsK
PiA+ICstIGRhdGEtbWFwcGluZzogc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2x2ZHMueWFtbAo+ID4gKwkJZm9yIG1vcmUgZGV0YWlscyBhYm91dCB0
aGlzIExWRFMgZGF0YS1tYXBwaW5nIHByb3BlcnR5Lgo+ID4gKwkJU3VwcG9ydGVkIHZhbHVlczoK
PiA+ICsJCSJqZWlkYS0xOCIKPiA+ICsJCSJqZWlkYS0yNCIKPiA+ICsJCSJ2ZXNhLTI0Igo+ID4g
IAo+ID4gIEV4YW1wbGUKPiA+ICAtLS0tLS0tICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
