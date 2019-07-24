Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D59673B0A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 21:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734E46E648;
	Wed, 24 Jul 2019 19:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E046E648
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 19:58:39 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z3so92279371iog.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 12:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PQGl4LrVkZJQR8JrdRonxvKem1COImKXVs35tCWL8j0=;
 b=ZKwJPV2Gh5B13L9o7fjIURkCGTj94CYc6rhUkfL1F2oUgguc6NQIswYN3/JPN3MGiI
 vMmMVInYvxKjm3KKgtTkuJBGj0cszf/8fTDmNq9uEPUvvMwGN+Juq0SYMFTWrYwWejfN
 SITsiERDs5u35BDufW8cwki7kLhqfsPvS9YqH2Cih/xq3ROkzAIBXfqJucvrDa46Ra7O
 8lLEE4t0rsK+0l9DB69hwjThxgCvstm7HigfOS4bjfPHOhLuQNWU2v8jDI7NSvlYaj11
 30xcPjyBcwulZNNP9qW712V5gyrtPvbbpycgX1C7jqrHOTzcKwGh8URMFqcmfDqVZWBw
 cyXg==
X-Gm-Message-State: APjAAAWgKTSMlXdoc/VyWYlVO8B0TunSjA/Mh2shZDYahzyf7cF/qRZ2
 vdpPHIFwsQl6rHU/F7Ypng==
X-Google-Smtp-Source: APXvYqxi9X4XWOEfCJ6JS14Ne21ncbmXUxzwspE0k996mu5PRuDKTM96/1vcibyF6K4aFfn+vigdfQ==
X-Received: by 2002:a02:b68f:: with SMTP id i15mr57425231jam.107.1563998318758; 
 Wed, 24 Jul 2019 12:58:38 -0700 (PDT)
Received: from localhost ([64.188.179.254])
 by smtp.gmail.com with ESMTPSA id r5sm43464553iom.42.2019.07.24.12.58.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 12:58:38 -0700 (PDT)
Date: Wed, 24 Jul 2019 13:58:37 -0600
From: Rob Herring <robh@kernel.org>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Message-ID: <20190724195837.GA19234@bogus>
References: <20190708165647.46224-1-jeffrey.l.hugo@gmail.com>
 <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190708165753.46275-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAgOCBKdWwgMjAxOSAwOTo1Nzo1MyAtMDcwMCwgSmVmZnJleSBIdWdvIHdyb3RlOgo+
IFRoZSBTaGFycCBMRC1ENTExNlowMUIgaXMgYSAxMi4zIiBlRFAgcGFuZWwgd2l0aCBhIDE5MjBY
MTI4MCByZXNvbHV0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEplZmZyZXkgSHVnbyA8amVmZnJl
eS5sLmh1Z29AZ21haWwuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZu
Ym9yZy5vcmc+Cj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi50
eHQgICAgICB8IDI2ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3NoYXJwLGxkLWQ1MTE2ejAxYi50eHQKPiAKClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
