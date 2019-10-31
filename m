Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EF6EADDA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 11:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C656EE1D;
	Thu, 31 Oct 2019 10:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881F96EE1D
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2019 10:52:07 +0000 (UTC)
Received: from dhcp-159-84-61-180.univ-lyon2.fr ([159.84.61.180]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iQ83B-0004dd-3J; Thu, 31 Oct 2019 11:51:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
 rk3288-veyron-analog-audio
Date: Thu, 31 Oct 2019 11:51:31 +0100
Message-ID: <6246654.jvjegRjDd5@phil>
In-Reply-To: <20191028071930.145899-6-cychiang@chromium.org>
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-6-cychiang@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, alsa-devel@alsa-project.org,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, Liam Girdwood <lgirdwood@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, dianders@chromium.org,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gTW9udGFnLCAyOC4gT2t0b2JlciAyMDE5LCAwODoxOToyOSBDRVQgc2NocmllYiBDaGVuZy1Z
aSBDaGlhbmc6Cj4gQWxsIGJvYXJkcyB1c2luZyByazMyODgtdmV5cm9uLWFuYWxvZy1hdWRpby5k
dHNpIGhhdmUgSERNSSBhdWRpby4KPiBTcGVjaWZ5IHRoZSBzdXBwb3J0IG9mIEhETUkgYXVkaW8g
b24gbWFjaGluZSBkcml2ZXIgdXNpbmcKPiByb2NrY2hpcCxoZG1pLWNvZGVjIHByb3BlcnR5IHNv
IG1hY2hpbmUgZHJpdmVyIGNyZWF0ZXMgSERNSSBhdWRpbyBkZXZpY2UuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2hlbmctWWkgQ2hpYW5nIDxjeWNoaWFuZ0BjaHJvbWl1bS5vcmc+CgphcHBsaWVkIGZv
ciA1LjUKClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
