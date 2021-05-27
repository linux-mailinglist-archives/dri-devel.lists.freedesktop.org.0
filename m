Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4870393336
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 18:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2326F41D;
	Thu, 27 May 2021 16:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D436F41D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:10:03 +0000 (UTC)
Received: from [192.168.1.101] (83.6.168.54.neoplus.adsl.tpnet.pl
 [83.6.168.54])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 201923F116;
 Thu, 27 May 2021 18:10:00 +0200 (CEST)
Subject: Re: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
 <20210228124106.135812-2-konrad.dybcio@somainline.org>
 <20210322161810.biagj2qro66rv4gt@maple.lan> <20210323083935.GF2916463@dell>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <a81bfa44-ed86-207c-0f8c-c9bbad62733d@somainline.org>
Date: Thu, 27 May 2021 18:09:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210323083935.GF2916463@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Why are you Reviewing/Acking a patch that was applied on the 10th?

Forgive me if it turns out I'm blind, but I can't see the patch being in either -next, backlight/for-next, or 5.13-rc3. Perhaps it was omitted after all?


Konrad

