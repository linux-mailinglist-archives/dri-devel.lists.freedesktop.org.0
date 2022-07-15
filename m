Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C0A575FC2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21B112B3F;
	Fri, 15 Jul 2022 11:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F0610FD8A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:08:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f2so6273006wrr.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 04:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OmAVkQqBTTkr9luYSoZNqmHxg6zKrdYzcTAh39XB80E=;
 b=WHo2FU3vtMGV3aElDTXi+mGo+/8MM2a56xn0TGixZDPayyPzlYagMDJb7abO5NWLzp
 V6QBe6cHD2iC/JjNFxLPxxOkhjL2OX/IQxZ9AxnfnJ2g07EfV1gs1EbdNy/qtP7P/2iQ
 Fze5KHOR30JKo0qsuODX1AcxJOdEZhyqW4oE0BMVyiOfKB52QWepFHScSFaY8BWFlIsZ
 YlSE3dUxuRILm9qIcuyDMx6m3f2l15QkleH49hBbN5FUtnO6/rYYj1LikLf/fUWV4as4
 ctMSdWmGHme0FScQiEXP8K97X/D6Ru8dB84i8MuyaqKCuSuKuUqG7pBlCOVwR9dMXeOZ
 LYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OmAVkQqBTTkr9luYSoZNqmHxg6zKrdYzcTAh39XB80E=;
 b=Ax2tqT2vN3aPO0xPUklYz6kU7cdw4cZLwKI6AB1DK+9nSPRiAfszgXZixGc4onlwGg
 6oFdzxGBFUxR8+UCZPyCEZU28q0RybYQkKD3LwIdn590JJQ3R9OhgkZ7J+XCKKNj2AOY
 J+7h9HwAXU/ALwjIUYZiWg9uvqCJcI+lMw2KzR8D4obow8enkIVpO8urthRnxbP7CpJM
 A6ieUzt1B8dGqpO76XRGvLWhbJVJLNqyiwv58LbRAYlZFHgLh9CTC3GVm2E9TYcGmyUn
 eTGanYFA5RE8nVPkdQ/1IlAmLcd43loub5xahY5rS/fNorSvQRSBcNbHywUR4kJOlZcg
 lHzA==
X-Gm-Message-State: AJIora/f4qfRanA3LVKb/iaYiGSONw/KMdwn9hOReuYtcd4im6IKpi3Y
 b+Mmr28ekz4YNGsTqaL6hN8ZUJFEqSQ0/bGo
X-Google-Smtp-Source: AGRyM1sEjpj7feotX5UfZAdeUwTZLkodeYC6VvTR5tSQyXV/Uekt9N0ER1lQi7rDu073X4wM9rjEKg==
X-Received: by 2002:a5d:59ac:0:b0:21d:944a:8a0e with SMTP id
 p12-20020a5d59ac000000b0021d944a8a0emr12137645wrr.61.1657883300766; 
 Fri, 15 Jul 2022 04:08:20 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d56d2000000b0021a34023ca3sm3521355wrw.62.2022.07.15.04.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 04:08:20 -0700 (PDT)
Date: Fri, 15 Jul 2022 12:08:18 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 6/8] dt-bindings: backlight: Update Lee Jones' email
 address
Message-ID: <20220715110818.2hxept5xuaxkpcvw@maple.lan>
References: <20220714112533.539910-1-lee@kernel.org>
 <20220714112533.539910-7-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220714112533.539910-7-lee@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 14, 2022 at 12:25:31PM +0100, Lee Jones wrote:
> Going forward, I'll be using my kernel.org for upstream work.
>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-leds@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Lee Jones <lee@kernel.org>


Daniel.
