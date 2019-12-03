Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F69111B72
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 23:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587056F420;
	Tue,  3 Dec 2019 22:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B800B6F420
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 22:12:03 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id t25so2643657oij.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 14:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pldoBT5ORXz4aapzHPt3ccAwmiFN0lj2178c3XaiQRo=;
 b=AYnU+aly2w7iuMIXow8w2uJ/1j081Bxle7kLrktbJSIkJuw2h9I07LEOCphGsHHCvU
 3SRpIZKqOflQ/UL9rUak5bxLayBGhu9GmQiux7h1RA5qHVLaw3r0WkX441gNWaiUGc22
 1Iee5+Td7qrK2iOT9EGuR27dyNByG5ipXp7WL09p/R++pEu/M0S9TEFLhQwql4a9whPY
 i/RTYf0INbv7vhC7BVnIlpzTK8ITEhKTz0eo2FXUwaftvdg7It7XmCcfQOHc4vWE2cj9
 xljLYu9VYysYnXEJEQ0/NXi4uXca7/JAK7cUs/KucTNgAwEm/XMUHB0Pndlok2uhlilI
 rYrw==
X-Gm-Message-State: APjAAAVp8g11v7bxEI+x7WA3uPlkkvMhEhI0sL7W2dVKiwCtP9R7iMcy
 LfSfBU0kO1O+aNChWXjgl+wMuGI=
X-Google-Smtp-Source: APXvYqysvr90M90SJ2c9VBE2qhNi1oQIbDw7W8BDqJAjL+rSeTywUX/kbsja7PlOsf7oL6ErQP69kA==
X-Received: by 2002:aca:4ad8:: with SMTP id x207mr208772oia.148.1575411122893; 
 Tue, 03 Dec 2019 14:12:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w12sm1486360otk.75.2019.12.03.14.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 14:12:02 -0800 (PST)
Date: Tue, 3 Dec 2019 16:12:01 -0600
From: Rob Herring <robh@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] dt-bindings: display/ingenic: Add compatible string
 for JZ4770
Message-ID: <20191203221201.GA3201@bogus>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 od@zcrc.me
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxOSBOb3YgMjAxOSAxNToxNzozMSArMDEwMCwgUGF1bCBDZXJjdWVpbCB3cm90ZToK
PiBBZGQgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgdGhlIExDRCBjb250cm9sbGVyIGZvdW5kIGlu
IHRoZSBKWjQ3NzAgU29DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxA
Y3JhcG91aWxsb3UubmV0Pgo+IC0tLQo+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9pbmdlbmljLGxjZC50eHQgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCj4gCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
