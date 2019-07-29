Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C378E26
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 16:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462A89E86;
	Mon, 29 Jul 2019 14:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B685989DB4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 14:37:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 366BB20049;
 Mon, 29 Jul 2019 16:37:50 +0200 (CEST)
Date: Mon, 29 Jul 2019 16:37:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/1] drm: mxsfb: add i.MX6UL in Kconfig
Message-ID: <20190729143749.GB16927@ravnborg.org>
References: <20190729141349.28465-1-sebastien.szymanski@armadeus.com>
 <CAOMZO5CFqQEdqgwyHZ2E2F22QDgG8SUjBM0y4Y6qyn8Tqo4O0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMZO5CFqQEdqgwyHZ2E2F22QDgG8SUjBM0y4Y6qyn8Tqo4O0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=k4gcJ1N8AAAA:8
 a=DC0Yf-lEFtUxtSPTF2MA:9 a=wPNLvfGTeEIA:10 a=0EuUHwVWM4Mljrm1lpjw:22
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
Cc: Marek Vasut <marex@denx.de>, David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Julien BOIBESSOT <julien.boibessot@armadeus.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU8OpYmFzdGllbiwKT24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMTE6Mjc6MzdBTSAtMDMwMCwg
RmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBTw6liYXN0aWVuLAo+IAo+IE9uIE1vbiwgSnVsIDI5
LCAyMDE5IGF0IDExOjE0IEFNIFPDqWJhc3RpZW4gU3p5bWFuc2tpCj4gPHNlYmFzdGllbi5zenlt
YW5za2lAYXJtYWRldXMuY29tPiB3cm90ZToKPiAKPiA+ICBjb25maWcgRFJNX01YU0ZCCj4gPiAt
ICAgICAgIHRyaXN0YXRlICJpLk1YMjMvaS5NWDI4L2kuTVg2U1ggTVhTRkIgTENEIGNvbnRyb2xs
ZXIiCj4gPiArICAgICAgIHRyaXN0YXRlICJpLk1YMjMvaS5NWDI4L2kuTVg2U1gvaS5NWDZVTCBN
WFNGQiBMQ0QgY29udHJvbGxlciIKPiAKPiBUaGlzIElQIGlzIGFsc28gZm91bmQgb24gaS5NWDZT
TCwgaS5NWDdELCBpLk1YN1MsIGkuTVg4TSwgaS5NWDhRWFAsIGV0Ywo+IAo+IEkgdGhpbmsgaXQg
d291bGQgYmUgYmV0dGVyIGlmIHdlIGRvIG5vdCBrZWVwIGluY3JlYXNpbmcgdGhlIGxpc3Qgb2YK
PiBzdXBwb3J0ZWQgU29DcyBpbiB0aGUgS2NvbmZpZyB0ZXh0LgoKQ291bGQgd2UgdGhyb3cgYSBD
T01QSUxFX1RFU1QgaW4gdGhlIG1peCBzbyB3ZSBnZXQgYmV0dGVyIGJ1aWxkCmNvdmVyYWdlIHRv
bz8KCglTYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
