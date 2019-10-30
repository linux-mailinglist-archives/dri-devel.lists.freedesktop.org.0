Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C5EAC45
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028BD6EDF3;
	Thu, 31 Oct 2019 09:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id B84F96EAA0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 16:16:09 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 3A61C8027;
 Wed, 30 Oct 2019 16:16:43 +0000 (UTC)
Date: Wed, 30 Oct 2019 09:16:04 -0700
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 1/7] dt-bindings: gpu: pvrsgx: add initial bindings
Message-ID: <20191030161604.GA5610@atomide.com>
References: <cover.1571424390.git.hns@goldelico.com>
 <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0fb68dc7bc027e5e911721852f6bc6fa2d77a63.1571424390.git.hns@goldelico.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
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
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBILiBOaWtvbGF1cyBTY2hhbGxlciA8aG5zQGdvbGRlbGljby5jb20+IFsxOTEwMTggMTg6NDdd
Ogo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3B1L2ltZyxwdnJzZ3gudHh0Cj4gQEAgLTAsMCArMSw3NiBAQAo+ICtJbWFnaW5hdGlvbiBQ
VlIvU0dYIEdQVQo+ICsKPiArT25seSB0aGUgSW1hZ2luYXRpb24gU0dYNTMwLCBTR1g1NDAgYW5k
IFNHWDU0NCBHUFVzIGFyZSBjdXJyZW50bHkgY292ZXJlZCBieSB0aGlzIGJpbmRpbmcuCj4gKwo+
ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6CVNob3VsZCBiZSBvbmUgb2YK
PiArCQkiaW1nLHNneDUzMC0xMjEiLCAiaW1nLHNneDUzMCIsICJ0aSxvbWFwLW9tYXAzLXNneDUz
MC0xMjEiOwo+ICsJCSAgLSBCZWFnbGVCb2FyZCBBQkMsIE9wZW5QYW5kb3JhIDYwME1Iego+ICsJ
CSJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtb21hcDMtc2d4NTMwLTEy
NSI7Cj4gKwkJICAtIEJlYWdsZUJvYXJkIFhNLCBHVEEwNCwgT3BlblBhbmRvcmEgMUdIego+ICsJ
CSJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtYW0zNTE3LXNneDUzMC0x
MjUiOwo+ICsJCSJpbWcsc2d4NTMwLTEyNSIsICJpbWcsc2d4NTMwIiwgInRpLG9tYXAtYW0zMzV4
LXNneDUzMC0xMjUiOwo+ICsJCSAgLSBCZWFnbGVCb25lIEJsYWNrCj4gKwkJImltZyxzZ3g1NDAt
MTIwIiwgImltZyxzZ3g1NDAiLCAidGksb21hcC1vbWFwNC1zZ3g1NDAtMTIwIjsKPiArCQkgIC0g
UGFuZGFib2FyZCAoRVMpCj4gKwkJImltZyxzZ3g1NDQtMTEyIiwgImltZyxzZ3g1NDQiLCAidGks
b21hcC1vbWFwNC1zZ3g1NDQtMTEyIjsKPiArCQkiaW1nLHNneDU0NC0xMTYiLCAiaW1nLHNneDU0
NCIsICJ0aSxvbWFwLW9tYXA1LXNneDU0NC0xMTYiOwo+ICsJCSAgLSBPTUFQNSBVRVZNLCBQeXJh
IEhhbmRoZWxkCj4gKwkJImltZyxzZ3g1NDQtMTE2IiwgImltZyxzZ3g1NDQiLCAidGksb21hcC1k
cmE3LXNneDU0NC0xMTYiOwoKRllJLCB0aGUgY29tcGF0aWJsZSBuYW1lcyBhYm92ZSBoYXZlIHVu
bmVjZXNzYXJ5IG9tYXAgaW4gdGhlbToKCiJ0aSxvbWFwLW9tYXAzLXNneDUzMC0xMjEiIHNob3Vs
ZCBiZSAidGksb21hcDMtc2d4NTMwLTEyMSIKInRpLG9tYXAtYW0zMzV4LXNneDUzMC0xMjUiIHNo
b3VsZCBiZSAidGksYW0zMzV4LXNneDUzMC0xMjUiOwoidGksb21hcC1kcmE3LXNneDU0NC0xMTYi
IHNob3VsZCBiZSAidGksZHJhNy1zZ3g1NDQtMTE2IgoKQW5kIHNvIG9uLgoKUmVnYXJkcywKClRv
bnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
