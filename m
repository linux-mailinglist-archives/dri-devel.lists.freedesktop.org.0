Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91828197AE5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 13:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5F6E258;
	Mon, 30 Mar 2020 11:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BBC6E258
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 11:35:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 0AFF7292B4B
Subject: Re: [PATCH v1 2/6] drm/fb: fix kernel-doc in drm_framebuffer.h
To: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-3-sam@ravnborg.org>
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <276f08eb-4cf4-1696-520b-71c08cedf6a3@collabora.com>
Date: Mon, 30 Mar 2020 13:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328132025.19910-3-sam@ravnborg.org>
Content-Language: en-US
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mikita Lipski <mikita.lipski@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Nirmoy Das <nirmoy.das@amd.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VyBkbml1IDI4LjAzLjIwMjAgb8KgMTQ6MjAsIFNhbSBSYXZuYm9yZyBwaXN6ZToKPiBGaXggZm9s
bG93aW5nIHdhcm5pbmdzOgo+IGRybV9mcmFtZWJ1ZmZlci5oOjM0Mjogd2FybmluZzogRnVuY3Rp
b24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYmxvY2tfd2lkdGgnIG5vdCBkZXNjcmliZWQgaW4gJ2Ry
bV9hZmJjX2ZyYW1lYnVmZmVyJwo+IGRybV9mcmFtZWJ1ZmZlci5oOjM0Mjogd2FybmluZzogRnVu
Y3Rpb24gcGFyYW1ldGVyIG9yIG1lbWJlciAnYmxvY2tfaGVpZ2h0JyBub3QgZGVzY3JpYmVkIGlu
ICdkcm1fYWZiY19mcmFtZWJ1ZmZlcicKPiAKPiBUcml2aWFsIHNwZWxsaW5nIG1pc3Rha2VzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBGaXhl
czogNTVmN2Y3Mjc1M2FiICgiZHJtL2NvcmU6IEFkZCBkcm1fYWZiY19mcmFtZWJ1ZmZlciBhbmQg
YSBjb3JyZXNwb25kaW5nIGhlbHBlciIpCj4gQ2M6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5k
cnplai5wQGNvbGxhYm9yYS5jb20+Cj4gQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNv
bGxhYm9yYS5jb20+Cj4gQ2M6IEphbWVzIFFpYW4gV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5j
b20+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6
IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IC0tLQo+ICAgaW5j
bHVkZS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmggfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9mcmFtZWJ1ZmZlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2ZyYW1lYnVmZmVyLmgKPiBp
bmRleCBlOWYxYjBlMjk2OGQuLmI1M2MwMzMyZjA0MCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2Ry
bS9kcm1fZnJhbWVidWZmZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mcmFtZWJ1ZmZlci5o
Cj4gQEAgLTMwOCwxMSArMzA4LDExIEBAIHN0cnVjdCBkcm1fYWZiY19mcmFtZWJ1ZmZlciB7Cj4g
ICAJICovCj4gICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciBiYXNlOwo+ICAgCS8qKgo+IC0JICog
QGJsb2NrX3dpZGh0OiB3aWR0aCBvZiBhIHNpbmdsZSBhZmJjIGJsb2NrCj4gKwkgKiBAYmxvY2tf
d2lkdGg6IHdpZHRoIG9mIGEgc2luZ2xlIGFmYmMgYmxvY2sKPiAgIAkgKi8KPiAgIAl1MzIgYmxv
Y2tfd2lkdGg7Cj4gICAJLyoqCj4gLQkgKiBAYmxvY2tfd2lkaHQ6IGhlaWdodCBvZiBhIHNpbmds
ZSBhZmJjIGJsb2NrCj4gKwkgKiBAYmxvY2tfaGVpZ2h0OiBoZWlnaHQgb2YgYSBzaW5nbGUgYWZi
YyBibG9jawo+ICAgCSAqLwo+ICAgCXUzMiBibG9ja19oZWlnaHQ7Cj4gICAJLyoqCj4gCgpBY2tl
ZC1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
