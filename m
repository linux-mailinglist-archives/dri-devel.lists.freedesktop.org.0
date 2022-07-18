Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0350A577CFF
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 10:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD290AB6D9;
	Mon, 18 Jul 2022 08:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D774BABFED
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 08:01:17 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j1so11375832wrs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DQJCi6GGtAfAwwXw6aqusUs0n430hwn1M0qOXfspNqY=;
 b=M5OdmIoyOIU1D0O97StWOStYb1EJeDC+RtSxdqtDnAYx24LnFRw6GsKDgGX6sUUbCG
 B3b8Wm0ZBqgk8255QD0faXq55+h1GRNtv5VXyLLDJ8dp2/iyOJ0CrCdC1d8B2ZTfFcI1
 vwQ6LlYitb9US9tTdfCtq+zVgv9k5T8/Ajq2nRpRnNwe0trbSUxVLr2xPnsII4qZ1CEa
 e7I1oY41Ss7EhaerAZSy43WvH106NdvsCSoRnwo07Wi3a8zLjlKQVeII+kNbcn8EUK+q
 QxO9mKTe19iyIZ9wmUk1ua3dCxL36n3OkdErV3QUg91Qwme9hICIjRlEGvT9RY1/mInZ
 vImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DQJCi6GGtAfAwwXw6aqusUs0n430hwn1M0qOXfspNqY=;
 b=ehtBXt6VLg2nVZqYMI6BWA2h+Lol+a8DOi+2mnEDzhGFLiUTj+WqFSwElhRZtSYgR4
 d3PdEv1YNhvrpH0DTHrMPRAg4QnvgIJBwKZ7lkIojGMj8NRAk8xJng5EaMFb2kEoGBWp
 Qv74pTQurjGdLiZxp/bY62bvlCOrQfSbWIsUwBIr3Q0yhaP+CeFttHQw8j9orDLZ1Arl
 ixmad+ThJla21gbZjH5i06qOXwftgtDtM12OJiwnIFuaadaWirg3V6dibsiCsNisrpxt
 M1EJ/DiV2LXVjZVIkKLuNA5vPctz67u9FhK+EqkKzmdbBvocaVg6ce/0xNHhbfMptf19
 f73A==
X-Gm-Message-State: AJIora8cBf5Jl7Bv4q2nP2fxyjZ7FsZUovjri5CZBqLMQVnSQQIvffUp
 j9o5m4vaYdPuR94uXbCHqf3a7OH929HANw==
X-Google-Smtp-Source: AGRyM1uaavJhfPAV54zr6M0dI+YIzgZ0jDjMjCseRBJu0DDLlPWS/c+iqZjKrQVmb2bZyGnqFYxXVw==
X-Received: by 2002:adf:f14d:0:b0:21d:ad67:c2e0 with SMTP id
 y13-20020adff14d000000b0021dad67c2e0mr21953746wro.247.1658131276363; 
 Mon, 18 Jul 2022 01:01:16 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 d13-20020adfe84d000000b0020fcaba73bcsm10029105wrn.104.2022.07.18.01.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 01:01:15 -0700 (PDT)
Date: Mon, 18 Jul 2022 09:01:13 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 6/8] dt-bindings: backlight: Update Lee Jones' email
 address
Message-ID: <YtUTSY8+idP1UgxZ@google.com>
References: <20220714112533.539910-1-lee@kernel.org>
 <20220714112533.539910-7-lee@kernel.org>
 <20220717102406.GC14285@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220717102406.GC14285@duo.ucw.cz>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Jul 2022, Pavel Machek wrote:

> Hi!
> 
> > Going forward, I'll be using my kernel.org for upstream work.
> >
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Let me know if you want to take it through the LED tree.

Thanks for the offer.

The plan is to take it via Backlight tree.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
