Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE989414
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 23:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EC689E5B;
	Sun, 11 Aug 2019 21:11:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2C789E5B
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 21:11:24 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id CB5CF2002B;
 Sun, 11 Aug 2019 23:11:19 +0200 (CEST)
Date: Sun, 11 Aug 2019 23:11:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v4 0/4] Add drivers for auo, kd101n80-45na and boe,
 tv101wum-nl6 panels
Message-ID: <20190811211118.GA23636@ravnborg.org>
References: <20190811091001.49555-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811091001.49555-1-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=pdzb0zgU1xEUnBsD4PIA:9 a=CjuIK1q_8ugA:10
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
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSml0YW8uCgo+ICAuLi4vZGlzcGxheS9wYW5lbC9hdW8sa2QxMDFuODAtNDVuYS50eHQgICAg
ICAgfCAgMzQgKwo+ICAuLi4vZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4dCAgICAg
ICAgfCAgMzQgKwoKcGFuZWwgYmluZGluZ3MgYXJlIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIG1p
Z3JhdGVkIHRvIHRoZSBuZXcKbWV0YS1zY2hlbWEgZm9ybWF0LgpUaGVyZWZvcmUgbmV3IGJpbmRp
bmdzIHNob3VsZCBwcmVmZXJhYmx5IGFsc28gZm9sbG93IHRoZSBuZXcgZm9ybWF0LgoKQ2FuIHlv
dSBwbGVhc2UgbG9vayBpbnRvIHRoaXMuCkluIHVwc3RyZWFtIGFuZCBkcm0tbWlzYy1uZXh0IHRo
ZXJlIGlzIGFscmVhZHkgc29tZSBleGFtcGxlcy4KCk5vdGU6IEl0IGlzIG5vdCBhIGhhcmQgcnVs
ZSB0aGF0IG5ldyBiaW5kaW5ncyBzaGFsbCBiZSBpbgp0aGUgbmV3IG1ldGEtc2NoZW1hIGZvcm1h
dCAoLnlhbWwgZXh0ZW5zaW9uKSwgYnV0IGFzIHRoaXMgaXMKYmVzdCBwcmFjdGljZSBub3cgaXQg
aXMgcHJlZmVycmVkLgpTYW1lIGdvZXMgZm9yIGRpc3BsYXkgYmluZGluZ3MgYnR3LgoKCVNhbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
