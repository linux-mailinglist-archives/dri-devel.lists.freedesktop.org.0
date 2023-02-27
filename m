Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0ECA6A46C8
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 17:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30DE10E430;
	Mon, 27 Feb 2023 16:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B546E10E430
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 16:12:31 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-536af432ee5so191516367b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uog+NC3JDX/3s4EEtusxfV7GL8cg3o3rXi47XL2zYCU=;
 b=Gls/FT24wIDqw26A+35LedSLf7NuYWn6yBxWOp62zMIfBwD96VL75IXnSlFsREuqYo
 qqO0Lz/Wzz5Hj6iHZcmRZOSeEfOfdcWrppQh7PAi7c6zYUyRInHljeLQOthAvCG3bNYE
 CUtpnLIP+bYo/symJuOQHu3QRd1pYhA8sM050=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uog+NC3JDX/3s4EEtusxfV7GL8cg3o3rXi47XL2zYCU=;
 b=dQDTfmg3cjjpYHoWwGLkJhAkgT5qAB8RdNltByR4BV8AwFasuZ7lC0iQEhpq6TF1/5
 Q5GCt7WOPsfUO915CqKnSpSpbMU1zxfVvLd7i115euo6uJ5MYCLWR01F8hjMbkHvJ69O
 tVEgf4l726oKlu5Pd9spNzIgT6ISg4nZoEUHiExDNiVxb6wzpVqboir52dxbAQK+hoDT
 D7V3oWOhI3ro4UbkW9NPr+VEIO1GeyQuMDy551LdAYJst5QbhZ2CEJKKP4Psb/xgUHNT
 rITuBnhnpOx8BjEyVTGE4XSbg047XYmY6EtkJRg02zWzAbxbHhoMNaFWVp2u3oMHRIY+
 AbKQ==
X-Gm-Message-State: AO0yUKUdaoD9hCo1UWwWOxCjMvOKcl6k1YwPr0zprgqwBZ8XXl/wAtRc
 P7I1kLbWlm4Zu7W4e93a+jWgAb8O2IekXJ9LVncAMg==
X-Google-Smtp-Source: AK7set/+umnF+0qsxKl5X8OIztsVGHe3kI/eFvpRVMUjBST0vTyvdYJ88amXAAJTSSmIvMwvDX6p6Y8TT11gxODv5xc=
X-Received: by 2002:a05:690c:31c:b0:52f:184a:da09 with SMTP id
 bg28-20020a05690c031c00b0052f184ada09mr26898ywb.2.1677514350621; Mon, 27 Feb
 2023 08:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
In-Reply-To: <20230216-topic-drm-panel-upstream-maintainance-v1-1-ae1cf9268217@linaro.org>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 Feb 2023 21:42:19 +0530
Message-ID: <CAMty3ZDCOHsei6yHxunk=zhEy7LAu20TwwFNiYmwWTM8NXLgbQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for DRM Panels
 drivers
To: Neil Armstrong <neil.armstrong@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 3:28 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
>
> Add myself as co-maintainer for DRM Panel Drivers in order to help
> reviewing and getting new panels drivers merged.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Thanks for doing this, I'm acking since I have potential involvement in Panels.

Acked-by: Jagan Teki <jagan@amarulasolutions.com>
