Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6EB2B09BF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 17:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B507A6E10B;
	Thu, 12 Nov 2020 16:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935096E213
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:21:19 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id dk16so8637033ejb.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 08:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E/FN38YKs3U5dDP8XDvk7Aai2br8IWt2qA1Mn0hfMr0=;
 b=konyp1S084B8yuveHNJp5oiCXcDb9EPNw59tzvXULpPQ9nehdL7yxHXpD/zBMlQ7uU
 r/kJGAY3/eIcZ8jYtJD6F1G4Qdp1DW/4uOK4HigEVBuCeW37U7BKubzFVCPqhCuQa35p
 mj6/ohZf1xr6OOPRJS1D6MWlarykjyXNJVESVEhq9XdrVOWL/L4VOI5Ty48RIksWfvB9
 gHtqZ6kr2AMWaPYGmEl92nfTt+QhhbmUl4E/cQk7nH5gyu9I7xxNSKwDJJT1AmDABR1d
 yEhatA/jfVw1DUEkD+k+D5+9GXaJZkjYeLbAN6iKzvtlOdWQlaVX1PyFm7Y9gbtVwiUf
 gBVw==
X-Gm-Message-State: AOAM531mV7V5XCSoCCKt/EL/rjIZlmwIxuYIrF7PhqeWrRlBTOrbj5wZ
 xLGnoeoQuCxwiPfAncNeuCU=
X-Google-Smtp-Source: ABdhPJxX91+qenOnJf5yqNQqr2xjxcTergOwox0iZEA+wSbh8d9LZ1oTeCAMEjZCvrUmWRVch4OZ+A==
X-Received: by 2002:a17:906:158e:: with SMTP id
 k14mr32003ejd.496.1605198078122; 
 Thu, 12 Nov 2020 08:21:18 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id p26sm800026eja.13.2020.11.12.08.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 08:21:16 -0800 (PST)
Date: Thu, 12 Nov 2020 17:21:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v9 3/5] MAINTAINERS: Add entry for Samsung interconnect
 drivers
Message-ID: <20201112162114.GA75637@kozik-lap>
References: <20201112140931.31139-1-s.nawrocki@samsung.com>
 <CGME20201112141051eucas1p1c94de8fd6032e0a9966cbff9e41c0f2f@eucas1p1.samsung.com>
 <20201112140931.31139-4-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112140931.31139-4-s.nawrocki@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 b.zolnierkie@samsung.com, linux-pm@vger.kernel.org, sw0312.kim@samsung.com,
 a.swigon@samsung.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, cw00.choi@samsung.com, robh+dt@kernel.org,
 myungjoo.ham@samsung.com, georgi.djakov@linaro.org,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 12, 2020 at 03:09:29PM +0100, Sylwester Nawrocki wrote:
> Add maintainers entry for the Samsung SoC interconnect drivers, this
> currently includes the Exynos generic interconnect driver.
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> Changes for v9:
>  - add linux-samsung-soc ML,
>  - fixed Artur's last name spelling,
>  - whole entry moved to maintain alphabetical order,
>  - added missing traling '/' to directory path.
> 
> Changes since v7:
>  - new patch.
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
