Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D42221408
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 20:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA9D89A74;
	Wed, 15 Jul 2020 18:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FCF89A74
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 18:13:33 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y2so3260379ioy.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 11:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2z0jMPmTB9DDXO4KvHh6iNAZTCEGZnUYmpDsMOv40Ws=;
 b=U3EQ+0kuWKAYxiD3v42aKuxYt0/rl/d8m6ZQSlEbHepaIJAQK6T9Os0GvA4rAzGgHt
 IHSt+g9pluRPGI67w7d25bJkkI+XZ3WIcHa5F4oEMbB8hHs7zSyHvx2Ll8kO5jGNnz6d
 GAwLs5AkekAidHKywYcXlIoiWR6F/j6fUyoDUD6rPKJ6RO/yW4Hldee+R5w4DNrVUwuI
 xrKelXloTLP5yKIp+7IKx+o+ca2ulUOdj2Bsdv1qkR6aUWycDjTkhkQcIdVW3geRS2ZM
 PiH8/ogZbjGaXaTj/zRrYdNLIaFk5/nDDjpSDheHKX2BE7y8uODGxZwW8bM3Iv6ZxaMR
 YgFg==
X-Gm-Message-State: AOAM531fODyz/89g9alGNHPgZU7qurSzciqgsm28bbMRnh2jHY/a60/o
 b4lD6u53vRZEUmDkIBg/mQ==
X-Google-Smtp-Source: ABdhPJzsTu/hCkev8ZsJi3uqyU6jm2P/7RkPJp0xkraSmBKKiHg3KKn2Gusj73gsQEdQONk2UrgabQ==
X-Received: by 2002:a6b:bb43:: with SMTP id l64mr504378iof.191.1594836812882; 
 Wed, 15 Jul 2020 11:13:32 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id u6sm1381601ilg.32.2020.07.15.11.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 11:13:32 -0700 (PDT)
Received: (nullmailer pid 546514 invoked by uid 1000);
 Wed, 15 Jul 2020 18:13:31 -0000
Date: Wed, 15 Jul 2020 12:13:31 -0600
From: Rob Herring <robh@kernel.org>
To: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: add vendor prefix for EastRising
 Technology Co., Ltd
Message-ID: <20200715181331.GA546460@bogus>
References: <cover.1592055494.git.kamlesh.gurudasani@gmail.com>
 <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <10dbf4687981634c510462804b8af6bbcf113fbf.1592055494.git.kamlesh.gurudasani@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 13 Jun 2020 19:36:46 +0530, Kamlesh Gurudasani wrote:
> Add vendor prefix for display manufacturer company EastRising
> Technology Co.,Ltd
> 
> [1]https://eastrising.en.ec21.com/
> 
> Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
