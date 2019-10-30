Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66DE9900
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 10:15:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45D58969E;
	Wed, 30 Oct 2019 09:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B826E8E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 09:15:26 +0000 (UTC)
Received: from [91.217.168.176] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iPk42-00079b-Tm; Wed, 30 Oct 2019 10:14:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH v9 5/6] ARM: dts: rockchip: Add HDMI support to
 rk3288-veyron-analog-audio
Date: Wed, 30 Oct 2019 10:14:49 +0100
Message-ID: <9095671.y4VLy4llMG@phil>
In-Reply-To: <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
References: <20191028071930.145899-1-cychiang@chromium.org>
 <20191028071930.145899-6-cychiang@chromium.org>
 <CA+Px+wXAo5EPjudneS+aFEAfBRAQR1Xp6goutdMdYTPeKcfTTA@mail.gmail.com>
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
 ALSA development <alsa-devel@alsa-project.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, dgreid@chromium.org,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Liam Girdwood <lgirdwood@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBbSBNaXR0d29jaCwgMzAuIE9rdG9iZXIgMjAxOSwgMTA6MDk6NDYgQ0VUIHNjaHJpZWIg
VHp1bmctQmkgU2hpaDoKPiBUaGlzIHNlcmllcyBoYXMgNiBwYXRjaGVzLiAgV2Ugbm90aWNlZCB5
b3UgaGF2ZSBtZXJnZWQgdGhlIGZpcnN0IDQKPiBwYXRjaGVzIChpbmNsdWRlcyB0aGUgRFQgYmlu
ZGluZyBvbmU6Cj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fs
c2EtZGV2ZWwvMjAxOS1PY3RvYmVyLzE1NzY2OC5odG1sKS4KPiAKPiBUaGVyZSBhcmUgMiBEVFMg
cGF0Y2hlcyBhcmUgc3RpbGwgb24gdGhlIGxpc3Q6Cj4gLSBbUEFUQ0ggdjkgNS82XSBBUk06IGR0
czogcm9ja2NoaXA6IEFkZCBIRE1JIHN1cHBvcnQgdG8KPiByazMyODgtdmV5cm9uLWFuYWxvZy1h
dWRpbwo+IGh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL3BpcGVybWFpbC9hbHNhLWRl
dmVsLzIwMTktT2N0b2Jlci8xNTc0OTkuaHRtbAo+IC0gW1BBVENIIHY5IDYvNl0gQVJNOiBkdHM6
IHJvY2tjaGlwOiBBZGQgSERNSSBhdWRpbyBzdXBwb3J0IHRvCj4gcmszMjg4LXZleXJvbi1taWNr
ZXkuZHRzCj4gaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvcGlwZXJtYWlsL2Fsc2Et
ZGV2ZWwvMjAxOS1PY3RvYmVyLzE1NzUwMC5odG1sCj4gCj4gQXJlIHlvdSB3YWl0aW5nIGZvciBv
dGhlciBtYWludGFpbmVycycgYWNrbm93bGVkZ2VtZW50PyAgT3IgZG8gd2UgbmVlZAo+IHRvIHJl
c2VuZCB0aGVtIHdpdGggbWF5YmUgc29tZSBtb2RpZmljYXRpb25zPwoKbm9wZSBhbGwgZ29vZCBs
aWtlIGl0IGlzLCBpZGVhbGx5IGRyaXZlci1jaGFuZ2VzIChpbmNsdWRpbmcgdGhlIGJpbmRpbmcp
CmFuZCB0aGUgZGV2aWNldHJlZS1jaGFuZ2VzIGl0c2VsZiBnbyB0aHJvdWdoIG15IHRyZWUgaW4g
dGhpcyBjYXNlLCBhcwpvdGhlcndpc2Ugd2Ugd291bGQgb2Z0ZW4gcnVuIGludG8gY29uZmxpY3Rz
IGlmIGR0cyBjaGFuZ2UgZ28gdGhyb3VnaAp2YXN0bHkgZGlmZmVyZW50IG1haW50YWluZXIgdHJl
ZXMuCgpPZiBjb3Vyc2UgZHRzIGNoYW5nZXMgY2FuIG9ubHkgZ2V0IGFwcGxpZWQgYWZ0ZXIgdGhl
IGRyaXZlciBzaWRlIGlzIGhhcHB5LApzbyBJJ2xsIGJlIHBpY2tpbmcgdXAgdGhlc2UgMiBjaGFu
Z2VzIChob3BlZnVsbHkgc2hvcnRseSkKCgpIZWlrbwoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
