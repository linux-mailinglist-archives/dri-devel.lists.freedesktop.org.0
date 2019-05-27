Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE22B383
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2D989915;
	Mon, 27 May 2019 11:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C972489915
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 55B10FB03;
 Mon, 27 May 2019 13:51:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fCuaeT0zfPIp; Mon, 27 May 2019 13:51:33 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0C954474FC; Mon, 27 May 2019 13:51:33 +0200 (CEST)
Date: Mon, 27 May 2019 13:51:32 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/2] drm: imx: Add NWL MIPI DSI host controller support
Message-ID: <20190527115132.GA11785@bogon.m.sigxcpu.org>
References: <cover.1551954425.git.agx@sigxcpu.org>
 <20190508171827.GA21725@bogon.m.sigxcpu.org>
 <20190527022401.GA6885@dragon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527022401.GA6885@dragon>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, Robert Chiras <robert.chiras@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIE1vbiwgTWF5IDI3LCAyMDE5IGF0IDEwOjI0OjAyQU0gKzA4MDAsIFNoYXduIEd1byB3
cm90ZToKPiBPbiBXZWQsIE1heSAwOCwgMjAxOSBhdCAwNzoxODoyN1BNICswMjAwLCBHdWlkbyBH
w7xudGhlciB3cm90ZToKPiA+IElmIHNvbWVib2R5IGlzIHdvcmtpbmcgb24gRENTUyBzdXBwb3J0
IGl0J2QgYmUgY29vbCB0byBrbm93IHNpbmNlIHRoaXMKPiAKPiBJIGhhdmUgc29tZSB0aW1lIHNs
b3RzIGhlcmUgYW5kIHdpbGwgc3RhcnQgbG9va2luZyBhdCBpdCwgaWYgbm8gb25lIGVsc2UKPiBp
cyBhbHJlYWR5IHdvcmtpbmcgb24gaXQuCgpOaWNlLiBNeSBjdXJyZW50IGZvcndhcmQgcG9ydCBv
ZiBhIG1pbmltYWwgRENTUyBuZWVkZWQgZm9yIERTSSBpcyBoZXJlOgoKICAgIGh0dHBzOi8vc291
cmNlLnB1cmkuc20vZ3VpZG8uZ3VudGhlci9saW51eC1pbXg4L3RyZWUvaW14OC01LngtZHJtCgpD
aGVlcnMsCiAtLSBHdWlkbwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
