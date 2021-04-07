Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 501C0356862
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 11:50:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237CB89949;
	Wed,  7 Apr 2021 09:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364DD89949
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 09:50:46 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFfjC2QgdzyNC7;
 Wed,  7 Apr 2021 17:48:31 +0800 (CST)
Received: from [10.67.110.73] (10.67.110.73) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.498.0;
 Wed, 7 Apr 2021 17:50:35 +0800
Subject: Re: [PATCH -next] drm/bridge: lt8912b: DRM_LONTIUM_LT8912B select
 GPIOLIB
To: Robert Foss <robert.foss@linaro.org>
References: <20210406090733.169989-1-zhangjianhua18@huawei.com>
 <CAG3jFyvC6ozPxQ=TPdPgLAugKky5AhOZGJSiw0Dc3Kn5Pba0cA@mail.gmail.com>
 <d9bd5abf-0293-6155-dee0-20199fed1fc0@huawei.com>
 <CAG3jFyu6YY5pr5bdvqAbzZu0GG0z=PWP+JHL59G26cg0P=563w@mail.gmail.com>
From: "zhangjianhua (E)" <zhangjianhua18@huawei.com>
Message-ID: <a40abdd7-af43-28a3-1b79-0de6ca0c0093@huawei.com>
Date: Wed, 7 Apr 2021 17:50:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAG3jFyu6YY5pr5bdvqAbzZu0GG0z=PWP+JHL59G26cg0P=563w@mail.gmail.com>
X-Originating-IP: [10.67.110.73]
X-CFilter-Loop: Reflected
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, johnny.chenyi@huawei.com,
 heying24@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhbmtzLCBJIHdpbGwgZG8gdGhhdC4KCuWcqCAyMDIxLzQvNyAxNjowMywgUm9iZXJ0IEZvc3Mg
5YaZ6YGTOgo+PiBZZXMsIHlvdSBhcmUgcmlnaHQsIHRoZXJlIGFyZSBtYW55IGZpbGVzIHJlZmVy
ZW5jZQo+PiBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoKSBhbmQKPj4KPj4gZGV2bV9ncGlvZF9n
ZXRfb3B0aW9uYWwoKS4gSG93IGFib3V0IGFkZCBjb25maWcgZGVwZW5kZW5jaWVzIGZvciBhbGwK
Pj4gcmVsZWF0ZWQKPiBJIHRoaW5rIHRoaXMgaXMgdGhlIHdheSB0byBnbyBhbmQgcm91Z2hseSBo
YWxmIG9mIHRoZSBkcm0gYnJpZGdlCj4gZHJpdmVycyBzZWVtIHRvIG5lZWQgdGhpcyBjaGFuZ2Uu
Cj4KPiBEbyB5b3UgbWluZCBzdWJtaXR0aW5nIGEgc2VyaWVzIG9mIHBhdGNoZXMgYWRkaW5nIHRo
aXMgZml4IGZvciBhbGwgb2YKPiB0aGUgcmVsZXZhbnQgYnJpZGdlIGRyaXZlcnM/Cj4KPj4gY29u
ZmlncyBvciBvbmx5IGFkZCBjb25maWcgZGVwZW5kZW5jaWVzIGZvciB0aGUgdG9wIGxldmVsIGNv
bmZpZz8KPj4KPiAuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
