Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F6045C17
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:04:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F58893D0;
	Fri, 14 Jun 2019 12:04:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43F1893D0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:04:56 +0000 (UTC)
Received: from we0305.dip.tu-dresden.de ([141.76.177.49] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hbkwr-0004uz-7x; Fri, 14 Jun 2019 14:04:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi: add basic rk3228 support
Date: Fri, 14 Jun 2019 14:04:48 +0200
Message-ID: <1679832.6k0ngRgKtg@phil>
In-Reply-To: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
References: <20190522224631.25164-1-justin.swartz@risingedge.co.za>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgMjMuIE1haSAyMDE5LCAwMDo0NjoyOSBDRVNUIHNjaHJpZWIgSnVzdGlu
IFN3YXJ0ejoKPiBMaWtlIHRoZSBSSzMzMjgsIFJLMzIyeCBTb0NzIG9mZmVyIGEgU3lub3BzaXMg
RGVzaWduV2FyZSBIRE1JIHRyYW5zbWl0dGVyCj4gYW5kIGFuIElubm9zaWxpY29uIEhETUkgUEhZ
Lgo+IAo+IEFkZCBhIG5ldyBkd19oZG1pX3BsYXRfZGF0YSBzdHJ1Y3QsIHJrMzIyOF9oZG1pX2Ry
dl9kYXRhLgo+IEFzc2lnbiBhIHNldCBvZiBtb3N0bHkgZ2VuZXJpYyByazMyMjhfaGRtaV9waHlf
b3BzIGZ1bmN0aW9ucy4KPiBBZGQgZHdfaGRtaV9yazMyMjhfc2V0dXBfaHBkKCkgdG8gZW5hYmxl
IHRoZSBIRE1JIEhQRCBhbmQgRERDIGxpbmVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1c3RpbiBT
d2FydHogPGp1c3Rpbi5zd2FydHpAcmlzaW5nZWRnZS5jby56YT4KCmFwcGxpZWQgdG8gZHJtLW1p
c2MtbmV4dAoKVGhhbmtzCkhlaWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
