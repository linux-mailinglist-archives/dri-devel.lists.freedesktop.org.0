Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C3494D22
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 12:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C1D10E448;
	Thu, 20 Jan 2022 11:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE32C10E456
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 11:40:36 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 v10-20020a4a860a000000b002ddc59f8900so2078351ooh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 03:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IURShh+tAODqAiJh+KDJ+01PfxKxuj1xZUOMackfOOk=;
 b=Vz1pvQALrPt8wZAYERJlR7js9v4/O4ym8VLsubf10xKBms/HSrNyJXsvLUKVPNz2er
 z9y+6nPpnS1qbFwvKwvJorb0aIcWu63ZFCha1bhWzJH7j1MFpfTrIFzyaQa00g+b1UFg
 wCO+8ajcrVTlY4dtkpmSgqGqvfxa4zoI31BvQggtxFB/0MXIwL9qG/XyDMZXxGeTkHiK
 vDn1LtEM2iBH8xCc+4qhPyIX5aK0onRaVfO6k6V2ZgTS6FQ7r+O88jb7LSRI7mYQh0sP
 kkC0b533v7hmJ/EjyCQ8E4jxwvWW9+JZqK4CRU2XFJCepYw+mCDbLaLCO0yyFAUVRbME
 bg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IURShh+tAODqAiJh+KDJ+01PfxKxuj1xZUOMackfOOk=;
 b=OQkG6HJQenICJ2pVIGOPim6zeOyEGWSGvFzGXPxsJtGYO4v/zqJeltB69afAnIoJnu
 0aCMFgE0NeZTK5CF25QcPpnm9s9ttaY+PTLbVPI38XeJ19ZXCx3At2jl3bJgGM9wmKvb
 Ffu4Wz+dcUDV8VzoogTA6QFM3xyjdYivldUAm9AuyK07Qco7G9wY6JqNqbXM7pA5fbY7
 ranH2tDayBBIEWdEufb5Lwj5tUvy9M+5TrrEbKrrIiIKg3o782XD5EnSk7+R/029opmZ
 4tqNy3dBSY6Tej+TWwdfMfSOx3Tzen8VOwy0AqLizYDfLYmMJbq9C+vRzCoQfn4ppGmH
 oA4g==
X-Gm-Message-State: AOAM533ISoVZdImW3KiBdjF8pT0PQMRcLFc3YDRju8NntkLV3mkSczn8
 pQb+elkjAq3kjJ24TTn5jTRlAsa+UouPyNSbxkE=
X-Google-Smtp-Source: ABdhPJzVUuPUA0+dLs3T4/ac9raYhHS1yiR6xjixMRgj1sa6nF5nfrTil5Enm8pp/zVblcBTM7eQu4CMn+laojzaQUo=
X-Received: by 2002:a05:6808:1b25:: with SMTP id
 bx37mr7082972oib.129.1642678836132; 
 Thu, 20 Jan 2022 03:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20220120104009.159147-1-krzysztof.kozlowski@canonical.com>
 <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
In-Reply-To: <a370a74a-2548-fc20-20b0-89e48645086f@baylibre.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 20 Jan 2022 12:40:24 +0100
Message-ID: <CAFqH_52NGQYjtEPvsK+pPM12-U6j9vhVCZCFwh6xAABdd+7hqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: drop Enric Balletbo i
 Serra from maintainers
To: Neil Armstrong <narmstrong@baylibre.com>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 Simon Glass <sjg@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, devicetree <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Linux Input <linux-input@vger.kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Missatge de Neil Armstrong <narmstrong@baylibre.com> del dia dj., 20
de gen. 2022 a les 11:52:
>
> On 20/01/2022 11:40, Krzysztof Kozlowski wrote:
> > Enric Balletbo i Serra emails bounce:
> >
> >   <enric.balletbo@collabora.com>: Recipient address rejected: User unknown in  local recipient table
> >
> > so drop him from the maintainers, similarly to commit 3119c28634dd
> > ("MAINTAINERS: Chrome: Drop Enric Balletbo i Serra").  Add generic DRM
> > bridge maintainers to Analogix ANX7814.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > ---
> >  .../devicetree/bindings/display/bridge/analogix,anx7814.yaml  | 4 +++-
> >  .../bindings/display/bridge/google,cros-ec-anx7688.yaml       | 1 -
> >  Documentation/devicetree/bindings/display/bridge/ps8640.yaml  | 1 -
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > index 8e13f27b28ed..bce96b5b0db0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7814.yaml
> > @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: Analogix ANX7814 SlimPort (Full-HD Transmitter)
> >
> >  maintainers:
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > +  - Andrzej Hajda <andrzej.hajda@intel.com>
> > +  - Neil Armstrong <narmstrong@baylibre.com>
> > +  - Robert Foss <robert.foss@linaro.org>
> >
> >  properties:
> >    compatible:
> > diff --git a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > index 9f7cc6b757cb..a88a5d8c7ba5 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> > @@ -8,7 +8,6 @@ title: ChromeOS EC ANX7688 HDMI to DP Converter through Type-C Port
> >
> >  maintainers:
> >    - Nicolas Boichat <drinkcat@chromium.org>
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >
> >  description: |
> >    ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > index cdaf7a7a8f88..186e17be51fb 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ps8640.yaml
> > @@ -8,7 +8,6 @@ title: MIPI DSI to eDP Video Format Converter Device Tree Bindings
> >
> >  maintainers:
> >    - Nicolas Boichat <drinkcat@chromium.org>
> > -  - Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >
> >  description: |
> >    The PS8640 is a low power MIPI-to-eDP video format converter supporting
> >
>
> Let's wait for Enric's response, but in any case (removal or new address):
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>

I'm fine with the removal as I don't have access anymore to this
hardware so it doesn't really make sense to be there. Sorry for not
sending the patches myself before.

Acked-by: Enric Balletbo i Serra <eballetbo@kernel.org>

Best regards,
  Enric

> Neil
