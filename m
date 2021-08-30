Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95C3FB5FA
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 14:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC92C895B9;
	Mon, 30 Aug 2021 12:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47808895B9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 12:26:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 170BD61164
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 12:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630326416;
 bh=8rxzpDDvLETpRjSW5EG7EPps6YmGomM3Beiqdp8hL8s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bFtCjuVnW9yirgFzqcJWAnYSkM1Lhlg9QSRerffQp7Rk4/9vUDaLoDmkVe7AD5/W2
 bUICCo62D5Pr4nmPIOB12Kmdblx7xGuPR9EyAR719YykrxzWmMTVUtL3BARQxyxd68
 pqfOOcBdthaH8nG6Qeq8fBIkIG9r9C6B5P0tksWUIiGBVPsfbYrqWMJvt/BbOl688Q
 jGWUe4sLgO8TDeU//cLdVn/HaBI468J5mhJ/HzVNBUp/flXHaJMgJKSdqhSzrATgFs
 PcTmfJXAePBo45Rrp5sLr3KVRv7A6gZ0H5CqJtwxeJVBI+z2uUnuKSiHSfWbrqPpCH
 bACB2rQFuPRFw==
Received: by mail-ed1-f52.google.com with SMTP id q17so21375396edv.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 05:26:55 -0700 (PDT)
X-Gm-Message-State: AOAM530XUpWXuvi0KQSFw+6xYOCuT3m5GPrBydt/pRBPa+79Tylbyigo
 YPZqhp/nhUYuxb8jKiFbxU77+YIip+RI3YVryA==
X-Google-Smtp-Source: ABdhPJxmILhJYcc+mYeJ+zf9N2F64SRnxQUQWPiG90l8vhjyNKaMHpm3/aiXGIjG5vOQD6D9of/DicoxU1EewIR4qsE=
X-Received: by 2002:a50:eb8a:: with SMTP id y10mr24087615edr.137.1630326414617; 
 Mon, 30 Aug 2021 05:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <YSQA/iR6D/Ej1kWx@ravnborg.org>
In-Reply-To: <YSQA/iR6D/Ej1kWx@ravnborg.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 30 Aug 2021 07:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKaUTXda_E0FLsHSt523=Tib6z5AgyOpoZA6iBNCht2-A@mail.gmail.com>
Message-ID: <CAL_JsqKaUTXda_E0FLsHSt523=Tib6z5AgyOpoZA6iBNCht2-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: panel: ili9341: correct indentation
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Dillon Min <dillon.minfei@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 23, 2021 at 3:11 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Thu, Aug 19, 2021 at 12:10:19PM +0200, Krzysztof Kozlowski wrote:
> > Correct indentation warning:
> >   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Thanks, applied to drm-misc-next, and the patch will show up in -next in
> one to two weeks.

This needs to go in fixes as it looks like commit 7dbdce806268
("dt-bindings: display: panel: Add ilitek ili9341 panel bindings") is
queued for 5.15.

Rob
