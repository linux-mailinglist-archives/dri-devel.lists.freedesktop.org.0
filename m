Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F64BD4100
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2019 15:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0506E402;
	Fri, 11 Oct 2019 13:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB0B6E402
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2019 13:22:05 +0000 (UTC)
Received: from ip5f5a6266.dynamic.kabel-deutschland.de ([95.90.98.102]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iIurp-0002Fu-1L; Fri, 11 Oct 2019 15:22:01 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v5 0/3] RK3288 Gamma LUT
Date: Fri, 11 Oct 2019 15:22:00 +0200
Message-ID: <2314316.IrHOdPmtjk@diego>
In-Reply-To: <20191010194351.17940-1-ezequiel@collabora.com>
References: <20191010194351.17940-1-ezequiel@collabora.com>
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
 Jacopo Mondi <jacopo@jmondi.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgMTAuIE9rdG9iZXIgMjAxOSwgMjE6NDM6NDggQ0VTVCBzY2hyaWViIEV6
ZXF1aWVsIEdhcmNpYToKPiBOZXcgaXRlcmF0aW9uLCBzZWVtcyB0aGF0IHdlIGFyZSBmaW5hbGx5
IGNvbnZlcmdpbmcuCj4gCj4gRm9yIHRoaXMgdjUsIHdlIGFyZSBvbmx5IGRvaW5nIHNvbWUgY2hh
bmdlcyBvbgo+IHRoZSBnYW1tYV9zZXQgaW1wbGVtZW50YXRpb24uIEFzIGEgcmVzdWx0LCB0aGUg
Y29kZQo+IGlzIG1vcmUgcmVhZGFibGUuIFNlZSB0aGUgY2hhbmdlbG9nIGluIHBhdGNoIDIgZm9y
IG1vcmUKPiBpbmZvcm1hdGlvbi4KPiAKPiBUaGFua3MhCgpvbiByazMyODggKGFuZCByazMzOTkr
cmszMzI4IHRvIG1ha2Ugc3VyZSBub3RoaW5nIGJyZWFrcykKVGVzdGVkLWJ5OiBIZWlrbyBTdHVl
Ym5lciA8aGVpa29Ac250ZWNoLmRlPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
