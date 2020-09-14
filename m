Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092A1269951
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 00:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED56E7FE;
	Mon, 14 Sep 2020 22:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3266E7FE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 22:58:46 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id a8so1237192ilk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 15:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RKxn9ltTeGk0IfBnG8P7vO3oM47OWQ2uxYOxzfrKlsA=;
 b=mJvaYORPjyQ+pu9kaDZl006QV30pVOW9OgSZZsw19goyu/rzres3oa5dLrFMzpX39b
 KbH3iiRu6ykMagsTO06yn51pXFL71dEJYHXZP7f53Cphlg6Kh7lvAdyN8VKdMcu61hMI
 bE0mDZeD61aR9JwTyCcp+y4nMkKvgXLexFebeK8l4ey81cF4rv9zhnwrqlFrW0ckVKa7
 vtrtm2Wy5l+PZ7DohH7U00U+fEummJY55VV+4qOVrswTqNxwe3bkFaQnDLW0q+PUGGlY
 erxpDmIKJSpTvS12pIxOPypBDN0aLAjWN8Zei6GxHRrffOd5SYjNjSCtZvklCAhk/Au9
 c7jg==
X-Gm-Message-State: AOAM531J4ptD7KsXha89oNISqMqYeBnsOOf2q2sagCU5jIXAeu1OuMYu
 fYXs5l/bIvTjv7FL5AnY3g==
X-Google-Smtp-Source: ABdhPJz6RwllSQxsqBRALQYuJie5kN26/ggu2+F6pAUHNple19DCIa7Sh1W/ch2mMtZYqjGoDexgKA==
X-Received: by 2002:a92:d08a:: with SMTP id h10mr9933338ilh.109.1600124325487; 
 Mon, 14 Sep 2020 15:58:45 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id u9sm6367518iow.26.2020.09.14.15.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 15:58:44 -0700 (PDT)
Received: (nullmailer pid 428538 invoked by uid 1000);
 Mon, 14 Sep 2020 22:58:43 -0000
Date: Mon, 14 Sep 2020 16:58:43 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Yes Optoelectronics
Message-ID: <20200914225843.GA428486@bogus>
References: <20200904180821.302194-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904180821.302194-1-jagan@amarulasolutions.com>
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
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 04 Sep 2020 23:38:19 +0530, Jagan Teki wrote:
> Add vendor dt-bindings for Yes Optoelectronics Co.,Ltd.
> 
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
