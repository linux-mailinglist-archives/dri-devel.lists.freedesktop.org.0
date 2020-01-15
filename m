Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7AC13C75E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 16:22:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534206EADC;
	Wed, 15 Jan 2020 15:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0198B6EADC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 15:22:29 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id 18so15696118oin.9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 07:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A7MJTIvyK8kzMyer64PozPs2FgL7mrURdQQ2XoMswP4=;
 b=X7wF0FQC0uODHFaamtwuyCpDIKk3sdnPFIA+CYci21p75rAlVVX7u8iqCJk3n3QECs
 pq1e0blJ8EmpXfwPvLmVU86xuVua38U7jXllDg5/LmnEIduLyAUQ9EAIyfjnZLYhyyCW
 jibkiW054W94+qm9UMV1h5d14TP4SiHSX7rZFllqjVr04nLGTezFObUrVF6rtw4DJtM0
 LC+2lLt/bS/cgYcQJnY2QZOBDO9A0AXGCpWRStyqBYLDyQRw9zbBqW4M/+efnCgtEij6
 3i04WQsiQon5xcMvVmDPZbo12bo7ju3wDZ3ku64t3HVVaT8Tad0bCo2ziFtKhvk9qr0D
 kmfA==
X-Gm-Message-State: APjAAAWiMXisW4pexRh3FyZ3rvXEEAMq07AXQ/JQuFQV6cX82LQMX8IW
 E7mnnoIU5k+Nm2WwqFu4ojE85pk=
X-Google-Smtp-Source: APXvYqx/F9gcoULlrVc+720GyPWzkHMRWIxAqApNnqLlGiqKBGDpaIs55/swUyZQYsIOT4lphUnAJg==
X-Received: by 2002:aca:f0b:: with SMTP id 11mr267596oip.34.1579101748997;
 Wed, 15 Jan 2020 07:22:28 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p184sm5721984oic.40.2020.01.15.07.22.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:22:28 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 220379
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 15 Jan 2020 09:22:27 -0600
Date: Wed, 15 Jan 2020 09:22:27 -0600
From: Rob Herring <robh@kernel.org>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefix: add Shenzhen Feixin
 Photoelectics Co., Ltd
Message-ID: <20200115152227.GA13106@bogus>
References: <20200110155225.1051749-1-icenowy@aosc.io>
 <20200110155225.1051749-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200110155225.1051749-2-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 10 Jan 2020 23:52:21 +0800, Icenowy Zheng wrote:
> Shenzhen Feixin Photoelectics Co., Ltd is a company to provide LCD
> modules.
> 
> Add its vendor prefix.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
