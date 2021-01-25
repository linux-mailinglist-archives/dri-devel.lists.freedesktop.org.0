Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9816302BAF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC496E0CA;
	Mon, 25 Jan 2021 19:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0BD6E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:34:37 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id f6so13899552ots.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nrzIYcJaC27vd9nGfsmTdb5Bn759r1uAoAX6/LzWCPs=;
 b=XljDvRn/0khSf4yLdKFgUPdaAOf2kIIj3JVV4/zhY0PIWmV56M63et1uNLPFe5nFgd
 fH5KWzAjRcaOdCaoC+6r1pIrKxUne6koOfSHgG+e/4ZFmoNirfslPNCvb+ahHnGNCmeW
 /vE20qqNUzyXBNunGYXKXXurDAoEKHrYHes6jnnq5fPWUQfl+3T8MrRVhB6ElncuJXPN
 PAYhTGzdMn0afkooeKSt9S8VIvxAY7aYaxZnMh2IwPb6fZtMjOKzy03/+DJVQ0hXh2kS
 OttM3FvCB1hfT2Goq4/sUrOb8uEzHFPQ7R97RTFYcNyJ4Vd8HhTEOKZ1SbERd3nf9RGA
 YOOg==
X-Gm-Message-State: AOAM533KAlZqQ+OYdWLpm6AEeeh/IX11ACGjg/knzWjYuW4okS/nMhVv
 uvdHJ0qhAfmoTR+N0xIaOw==
X-Google-Smtp-Source: ABdhPJyijhW8AYwSxyVmK4BOFt9iIwV1Dz1LEgyrj0WDTVlSe0I/nBQEXyJDkHgjsrV7xcz12Mtd7w==
X-Received: by 2002:a9d:7344:: with SMTP id l4mr1523845otk.181.1611603277224; 
 Mon, 25 Jan 2021 11:34:37 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e17sm3674840otf.32.2021.01.25.11.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:34:36 -0800 (PST)
Received: (nullmailer pid 826799 invoked by uid 1000);
 Mon, 25 Jan 2021 19:34:35 -0000
Date: Mon, 25 Jan 2021 13:34:35 -0600
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 20/24] ASoC: audio-graph-card: update
 audio-graph-card.yaml reference
Message-ID: <20210125193435.GA826683@robh.at.kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
 <8a779e6b9644d19c5d77b382059f6ccf9781434d.1610535350.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8a779e6b9644d19c5d77b382059f6ccf9781434d.1610535350.git.mchehab+huawei@kernel.org>
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021 11:59:21 +0100, Mauro Carvalho Chehab wrote:
> Changeset 97198614f6c3 ("ASoC: audio-graph-card: switch to yaml base Documentation")
> renamed: Documentation/devicetree/bindings/sound/audio-graph-card.txt
> to: Documentation/devicetree/bindings/sound/audio-graph-card.yaml.
> 
> Update its cross-reference accordingly.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/sii902x.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
