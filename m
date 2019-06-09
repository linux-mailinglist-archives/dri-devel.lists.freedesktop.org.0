Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F563A505
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 13:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8439B892BB;
	Sun,  9 Jun 2019 11:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABC9892BB
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jun 2019 11:07:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 5123C2002D;
 Sun,  9 Jun 2019 13:07:35 +0200 (CEST)
Date: Sun, 9 Jun 2019 13:07:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [2/2] drm/panel: support for BOE tv101wum-n16 wuxga dsi video
 mode panel
Message-ID: <20190609110733.GD28935@ravnborg.org>
References: <20190608070230.55381-1-jitao.shi@mediatek.com>
 <20190608070230.55381-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190608070230.55381-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=syvv3YeMXAyozcvYpBgA:9 a=CjuIK1q_8ugA:10
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

SGkgSml0YW8uCgo+ICsKPiArZW51bSBkc2lfY21kX3R5cGUgewo+ICsJSU5JVF9HRU5FTklDX0NN
RCwKPiArCUlOSVRfRENTX0NNRCwKPiArCURFTEFZX0NNRCwKPiArfTsKPiArCj4gK3N0cnVjdCBw
YW5lbF9pbml0X2NtZCB7Cj4gKwllbnVtIGRzaV9jbWRfdHlwZSB0eXBlOwo+ICsJc2l6ZV90IGxl
bjsKPiArCWNvbnN0IGNoYXIgKmRhdGE7Cj4gK307Cj4gKwo+ICsjZGVmaW5lIF9JTklUX0NNRCgu
Li4pIHsgXAo+ICsJLnR5cGUgPSBJTklUX0dFTkVOSUNfQ01ELFwKPiArCS5sZW4gPSBzaXplb2Yo
KGNoYXJbXSl7X19WQV9BUkdTX199KSwgXAo+ICsJLmRhdGEgPSAoY2hhcltdKXtfX1ZBX0FSR1Nf
X30gfQpUaGlzIG1hY3JvIGlzIG5vdCB1c2VkIC0gc28gYWxsIGNvZGUgYXJvdW5kIElOSVRfR0VO
RU5JQ19DTUQgY2FuIGJlCmRlbGV0ZWQuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
