Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0C9D8E7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB576E2F9;
	Mon, 26 Aug 2019 22:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E616E2F9;
 Mon, 26 Aug 2019 22:15:02 +0000 (UTC)
Received: from [104.132.1.107] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1i2NGB-0006X1-3B; Tue, 27 Aug 2019 00:14:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH RESEND 06/14] drm: rockchip: Provide ddc symlink in
 inno_hdmi sysfs directory
Date: Tue, 27 Aug 2019 00:14:41 +0200
Message-ID: <4123730.fx8cIkYQ17@phil>
In-Reply-To: <a1f778d328328f15300338600bb2400850717300.1566845537.git.andrzej.p@collabora.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
 <a1f778d328328f15300338600bb2400850717300.1566845537.git.andrzej.p@collabora.com>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Leo Li <sunpeng.li@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Alex Deucher <alexander.deucher@amd.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCAyNi4gQXVndXN0IDIwMTksIDIxOjI1OjQ4IENFU1Qgc2NocmllYiBBbmRyemVq
IFBpZXRyYXNpZXdpY3o6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2Vu
ZXJpYyBjb25uZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6
IDxhbmRyemVqLnBAY29sbGFib3JhLmNvbT4KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBj
b2xsYWJvcmEuY29tPgoKQWNrZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
