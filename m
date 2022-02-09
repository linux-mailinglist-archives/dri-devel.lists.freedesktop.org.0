Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927124AFFED
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72B89EB7;
	Wed,  9 Feb 2022 22:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA05689EB7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:14:13 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id ay7so4020061oib.8
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5w3QoXmnLsihgEA/Et9MpIi6nloh2mbWHhlRSc4SJVU=;
 b=wClN9+OzF20pw1jLyWXQY05TPKYB43MMGgcm+oYo2K4qNng4WvXP3HAJBsqRoYsrBN
 Ge1LsQxTi8X45YEGU4JaFJwmcq8Morzq9m51TVcIteEh4qJI5JPjreLbmEbjP7kpQVPr
 lFBE/g4pq8H7VyqoBS6nlDihPi33hfylOFRrTXSHxoz4N8CMPCEYOk+OFdY+FkBSagzX
 ib7azcTCaxj1WVaCiGhIYIvdSWouGxPtwRJwXiNq973O0xJmpWVGQpkyj1wugEzbRiia
 WaIwRAoS5EK2OlmzsI+a9B1kDTCu5y4bVu8xxByGZwAI1uhIOgfqlnp57W2vxjiFhjdz
 GXmQ==
X-Gm-Message-State: AOAM532WYDb0Ck3eALL70Fo+BGkt0ZGJAzRk3tteNdIC/E0ByHLSmzIK
 u76Nwj3R/KasDparlRF71Q==
X-Google-Smtp-Source: ABdhPJzweqXLNVP7+tC8UIOfrH2IH0wKhXWBXS/zBWs578C+quPBmzcGsHsOdY/vYUi67D0BCYkOXw==
X-Received: by 2002:a54:488c:: with SMTP id r12mr2027834oic.104.1644444852983; 
 Wed, 09 Feb 2022 14:14:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f21sm7069506otq.4.2022.02.09.14.14.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 14:14:12 -0800 (PST)
Received: (nullmailer pid 1028963 invoked by uid 1000);
 Wed, 09 Feb 2022 22:14:11 -0000
Date: Wed, 9 Feb 2022 16:14:11 -0600
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 4/4] dt-bindings: display: ssd1307fb: Add myself as
 binding co-maintainer
Message-ID: <YgQ8s5S3mqYMPyqW@robh.at.kernel.org>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <20220204134347.1187749-5-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204134347.1187749-5-javierm@redhat.com>
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
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Feb 2022 14:43:47 +0100, Javier Martinez Canillas wrote:
> The ssd130x DRM driver also makes use of this Device Tree binding to allow
> existing users of the fbdev driver to migrate without the need to change
> their Device Trees.
> 
> Add myself as another maintainer of the binding, to make sure that I will
> be on Cc when patches are proposed for it.
> 
> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
