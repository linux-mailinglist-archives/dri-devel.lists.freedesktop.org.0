Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46303198629
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 23:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C799A6E4AE;
	Mon, 30 Mar 2020 21:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DB16E4AE
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 21:15:09 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m15so19485873iob.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 14:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DiQpzvoXsdu2ngt5gwdJMip4fqFPo7qKub8h97nqjG0=;
 b=PnjFzgbFcB5SAqpj+7ufRz73lsC5ScrFZ/De9RcYM5ERG8fTz7ZdNAqJw3b50e5tex
 uyQs5eozuW5y8+gMEkabdbiTt/6I18Kao/rPS4xzcqwe4NE8k+GlxK6rCai1M4bPTpUN
 p1lunfIc5rI845kkgzQl/4xO2VZvMw0uNw8mBom0MEqjzpvbIrXd4EhA4UvAoiv6EBj0
 2xWfhLcfa/aMOCHqIeI7EG2ypd9elMUiGX35HxP+KcjN4dSN8Ht8dCrmGll7uS9QUXHf
 4lcVt5LnFU8t1G5Pkz3tpbfy4Y/8rQEg0C28oSD48X8PpzClkMEMXyZK+ipzuSKOrZ+U
 5K4g==
X-Gm-Message-State: ANhLgQ0gYR3tDzwUEzJLMKcwjB5LHS9KrkT77pvVIsTIzq/EnsK6uIfF
 +0QO88FXMBdeMLVTr6E2Og==
X-Google-Smtp-Source: ADFU+vvmElgbY3zcH67E5ZpTJhcpBhMdNuV5bHMxaQeVOZ5mZFOmyvAdfClT9+s9vA7kkG9dM9Mg6A==
X-Received: by 2002:a02:8784:: with SMTP id t4mr10913216jai.31.1585602909188; 
 Mon, 30 Mar 2020 14:15:09 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id w88sm5212239ila.24.2020.03.30.14.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 14:15:08 -0700 (PDT)
Received: (nullmailer pid 30071 invoked by uid 1000);
 Mon, 30 Mar 2020 21:15:07 -0000
Date: Mon, 30 Mar 2020 15:15:07 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 10/12] docs: dt: display/ti: fix typos at the devicetree/
 directory name
Message-ID: <20200330211507.GA14220@bogus>
References: <cover.1584450500.git.mchehab+huawei@kernel.org>
 <875b824ac97bd76dfe77b6227ff9b6b2671a6abf.1584450500.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875b824ac97bd76dfe77b6227ff9b6b2671a6abf.1584450500.git.mchehab+huawei@kernel.org>
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
Cc: devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 02:10:49PM +0100, Mauro Carvalho Chehab wrote:
> The name of the devicetree directory is wrong on those three
> TI bindings:
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Applied to drm-misc.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
