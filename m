Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B308447D0D5
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9761110E866;
	Wed, 22 Dec 2021 11:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5EE10E866
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:18:39 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id s1so4228821wrg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BTFrGRijmyqVtwNX+eYj7uLDLDEXDa8YjLzuMRD+fi4=;
 b=n1wWbc5/GBac4/7gX+mStLNdXD+9ZndYLSDI5tNU/kz1pFG6iO/9vDLjbq3DvBMd7w
 XDwjYdZrCF3T5s1L15XEHfsQe81DDgZNTBJGUXvkDlQdIGA71FSjMEnYgn3gz3LbqQgH
 JgGkm5YZGWh6e0AyCb2sK0g9PiUEL7B7UieKYvrzmgObGqfRvPMPKs0uhSUk9RJWHsCM
 V8dbXY3DQADZK5nusdcU76Fmwe4y5LKKgYmD4niSo6OGjcvhaPt9OJvsuQ3MrIPhmLow
 8ClxdDLz+f99tFS5ABAYB4WeonMu7CrFh5Vp/if6pzBieskOCnPyBORKZDHVlCyGhLLM
 CBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BTFrGRijmyqVtwNX+eYj7uLDLDEXDa8YjLzuMRD+fi4=;
 b=KJNvHU3cxEHzwfvUUV1bDPhVG+I/FzDdi2fPWWsRbyF67Ir0T7DDNxkuOLYFsokO5f
 6QQDrx5LaioV05xcCL31V9RwurkJFP6geZELYxu66NR/0FxHsWjiEN4IRImKiDjRMEqx
 R5M2zd5No7dKV8Je0ceLLBVFnXtqgPmSlQm4vAd5ar14zVzv1gImY586yPjWy38pYWhk
 hYfk2TxBRshEczbCqeIL2ktmZqyaPpuOE6gwTyeDweU4e1PssZBG53YAowYHphjGA/8b
 +7Ky5v/fUR2BPifYGnGZspV5Wvvk1EbZm66eQ1y7OtZ18NMDhBkyz89Gism02n4gEzUX
 ICuA==
X-Gm-Message-State: AOAM5338wJPPX2laOOEIK/h9Cyfwkjq/eNSWOJJC7ZcXA9URuJ9U5sZ3
 Vfsk9SjqnIJpkRev2dd4fXz8jw==
X-Google-Smtp-Source: ABdhPJw38s9cSuuBgFo9+w66UfDHy3rKbuDjgI0szZLbSoZofWuGha24IIq6shTkSBB6qomoMhNtng==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr1750277wrw.353.1640171917614; 
 Wed, 22 Dec 2021 03:18:37 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id a198sm1460546wmd.42.2021.12.22.03.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:18:37 -0800 (PST)
Date: Wed, 22 Dec 2021 11:18:35 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 8/9] backlight: qcom-wled: Remove unnecessary double
 whitespace
Message-ID: <YcMJi5Gpx84zaau6@google.com>
References: <20211115203459.1634079-1-marijn.suijten@somainline.org>
 <20211115203459.1634079-9-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211115203459.1634079-9-marijn.suijten@somainline.org>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Kiran Gunda <kgunda@codeaurora.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
 Bryan Wu <cooloney@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-fbdev@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 15 Nov 2021, Marijn Suijten wrote:

> Remove redundant spaces inside for loop conditions.  No other double
> spaces were found that are not part of indentation with `[^\s]  `.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
