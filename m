Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A325494D24
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3ED910E456;
	Thu, 20 Jan 2022 11:41:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38B10E4C3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:41:35 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 q15-20020a4a6c0f000000b002dc415427d3so2088138ooc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fodk+9GW+hT7jfC255jsfPt58onxdEeUfIkK8XqDsdU=;
 b=WdUH7oHIpGmQ8SPtqwrJiPo6uU40+yyqDTObz92VJVqIUVRbR/huWlPO+OEemREe1i
 W9li5UVN0/fik/d4eAlyLgEX2/q5da611IuIaKDdoY15R9ZrZollWwzX5od8VagBrQSv
 J0n4ZsDqh0BW9s+QtmPtIeiM+MR8L6dJ20J9EVfNSvgWA0OJaO3j0Mbanao+KVsXKHgA
 RG7gZr1jNrv8Bx0fJNHQv5wL4DSy+KS/9M2nbNzgkJ9ph8tz3VZqI6FL4XjwwDTAHWE+
 EIvmkUrl81al3gQqJqYZCImLkVNhjGaA657N8RJmJHw951cE2ADMlFHohM1vbsHACUUj
 15sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fodk+9GW+hT7jfC255jsfPt58onxdEeUfIkK8XqDsdU=;
 b=MlOxW/EDUytS3zxCDL1ITw/j+sggrgfXpA78J+5BWiy454zIefgiTbBM62wglIeLLB
 /tdjfC/uoE8eN2zevcO7nqkMOgdEBKj2P89gHqArs837SLr5TZzORMFkMz8feY4gcPw7
 9tUlZGHfc+RuYALWEX3+RSts3a/uQRcoBfW9mYihaCvnLkm+bpzNMkpjwWc8HU7O++N5
 bMIS4ApfB9OJoBfdhr8wUlKl4eY3joNtPKjq+MJhC7x16qKr9fHaGPY4iXNKwQG2tVCu
 +fsCYmR0Op/mtDQpCemyTMOtWW17FS59TwqsSdCglgJGrih4AKGrEIDwk0wmM82GryZ9
 Mj3w==
X-Gm-Message-State: AOAM532RT7S8i5e8kB6e1a0T2OWtpaGvfNin0jQnvXg+nNVOSlQmfedL
 b0VCvnfz6nHwnJsxq1b7XpaC8GBttGSgVqIxUog=
X-Google-Smtp-Source: ABdhPJyP1IfasnEpm5ZNB/lJD5ftcs9/ELkgDdsDowFlQRyxkRt4OJYwHHz6cCY6j3nkhbn8c3SAq/Q8lMLf1UPjlws=
X-Received: by 2002:a05:6808:1b25:: with SMTP id
 bx37mr7085479oib.129.1642678895086; 
 Thu, 20 Jan 2022 03:41:35 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120104009.159147-2-krzysztof.kozlowski@canonical.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 20 Jan 2022 12:41:23 +0100
Message-ID: <CAFqH_53T+w9gmbTLCt_c4ZR7=NV21hL4Hh0zn4pwm4Pqb0_L=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: google, cros-ec: drop Enric Balletbo i
 Serra from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-iio <linux-iio@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, Simon Glass <sjg@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Missatge de Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
del dia dj., 20 de gen. 2022 a les 11:40:
>
> Enric Balletbo i Serra emails bounce:
>
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
>
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

I'm fine with the removal as I don't have access anymore to this
hardware so it doesn't really make sense to be there. Sorry for not
sending the patches myself before.

Acked-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Best regards,
  Enric

> ---
>  .../devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml          | 1 -
>  .../devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml       | 1 -
>  .../bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml    | 1 -
>  Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml | 1 -
>  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml        | 1 -
>  5 files changed, 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> index 20e1ccfc8630..2d82b44268db 100644
> --- a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS EC USB Type-C cable and accessories detection
>
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
> diff --git a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> index b386e4128a79..6e1c70e9275e 100644
> --- a/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> +++ b/Documentation/devicetree/bindings/i2c/google,cros-ec-i2c-tunnel.yaml
> @@ -10,7 +10,6 @@ title: I2C bus that tunnels through the ChromeOS EC (cros-ec)
>  maintainers:
>    - Doug Anderson <dianders@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    On some ChromeOS board designs we've got a connection to the EC
> diff --git a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> index 099b4be927d4..00e3b59641d2 100644
> --- a/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> +++ b/Documentation/devicetree/bindings/iio/proximity/google,cros-ec-mkbp-proximity.yaml
> @@ -10,7 +10,6 @@ title: ChromeOS EC MKBP Proximity Sensor
>  maintainers:
>    - Stephen Boyd <swboyd@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    Google's ChromeOS EC sometimes has the ability to detect user proximity.
> diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> index 5377b232fa10..e8f137abb03c 100644
> --- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> +++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
> @@ -10,7 +10,6 @@ title: ChromeOS EC Keyboard
>  maintainers:
>    - Simon Glass <sjg@chromium.org>
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>
>  description: |
>    Google's ChromeOS EC Keyboard is a simple matrix keyboard
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index e9c46430fd8a..66a995bbbbe9 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -8,7 +8,6 @@ title: ChromeOS Embedded Controller
>
>  maintainers:
>    - Benson Leung <bleung@chromium.org>
> -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
>    - Guenter Roeck <groeck@chromium.org>
>
>  description:
> --
> 2.32.0
>
