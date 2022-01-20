Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C07494C07
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0712310E80C;
	Thu, 20 Jan 2022 10:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DDB10E80C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 10:48:29 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id c190so5743043qkg.9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 02:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dowhile0-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Drofg5bZM2qwAB7ATZ/cfW3+3FZXwgKGVP69ItIqA10=;
 b=lSFrpwW1wuAfDYgH03cW7I7OjP1WbLut0KjRhMrnTuGvNcnMybeWIQyMH1JIx00use
 yizqAk+va/sg/eFSjqoeYOXH0HLzvW3eaS930YNZ7e5h9ip0eD9d1p3WN/CjBKya/85l
 mcfYW4HK49fyHi+z6g7gsttn0/XTRnkA0JrcbZ8vAEFMc99HRXqRBh9g54gh8kCdMIHP
 Uy/leO8tXeu8VOapVIT9ExqJ1h2JsDwxr8R0jV4kFsVzHWQZ4duKK2h5zTEq+mJc5xwY
 pwglT+eOqfCVyz7nHNeUkkpmHVf/KXR4zpWZ1F4jD8ezJL5uWmGaPXIaZhEiHCZrb0Nw
 P/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Drofg5bZM2qwAB7ATZ/cfW3+3FZXwgKGVP69ItIqA10=;
 b=wccJtyqjxmIk/1SRF+ZVyeHE6xIIEPQnFehCJGpj9P3TI/KVhS2LpkhmFysZ/WcrcE
 tLM2gEUbi5WEM63a6hCus4BadeI0HKeYB7p6UqpDk117rvzPwocytYqHkkm2C0DrrTZf
 Tug/snp6xxzRSV56u2ZDQUA640ciFYHDNaCQW87SLgEyEg+U0d2dP76A7/KLzaGqfBgs
 hwlRtwcAC5X8GpjDcVrYU/8qLlobqQmjyRkU7nisphpdsNV/E7fzpnnt/3da9Fbus0Io
 Dvh8j74oGrkTuuopV7UNmKd7lRxLb5174g1DW+CkhQEDiJiGcJ1vL/X0GMvftjgUApp2
 DPDQ==
X-Gm-Message-State: AOAM530QOwoCO3Ct3ZU2OUw9NcBjStkjMaZS6zKyQczsYZWIBssA7K1y
 LwTGc4hzMpmbnDY2qjvtcjewMRXGNOpi+EAieGYyKQ==
X-Google-Smtp-Source: ABdhPJytHAAGxtq/qSZOpc+YupHixT4TRIrIOSLNgZfB6xUrCUXkckzmPRmlM/mOoCMvKsJgp3kOntmGDDsXWw0Jxwk=
X-Received: by 2002:a05:620a:1382:: with SMTP id
 k2mr18319057qki.447.1642675708891; 
 Thu, 20 Jan 2022 02:48:28 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
From: Javier Martinez Canillas <javier@dowhile0.org>
Date: Thu, 20 Jan 2022 11:48:18 +0100
Message-ID: <CABxcv==EkNd9MrpJuyECzY1EdnWiZ_ffz8OXoTy8X76R_Ty4Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-iio <linux-iio@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 David Airlie <airlied@linux.ie>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 Simon Glass <sjg@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Enric's personal email address to Cc list]

Hello Krzysztof,

On Thu, Jan 20, 2022 at 11:40 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Enric Balletbo i Serra emails bounce:
>
>   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
>
> so drop him from the maintainers, similarly to commit 3119c28634dd
> ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> bridge maintainers to Analogix ANX7814.
>

I'm adding Enric in case he is still interested in maintaining these
and prefers to update his email address instead.

Another option is to add an entry to the .mailmap file.

Best regards,
Javier
