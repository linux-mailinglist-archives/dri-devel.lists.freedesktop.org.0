Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0753DEA9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 00:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82C610E42B;
	Sun,  5 Jun 2022 22:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C442510E09B;
 Sun,  5 Jun 2022 22:38:34 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id p8so9318017qtx.9;
 Sun, 05 Jun 2022 15:38:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2o4Si/ESwdinfrZMz9nTD0LmxXF7OLAHry8I5SkRmG4=;
 b=3G+Xa0wAtbRQa7fMfwtPMs7hbcZ1BdqIByplSJ3AAcdCKy+KSUe6bPN+WiH7tjjiev
 zxrlAS4zLqPOlvaJLlgnXZuEvD/Bwxh7YZtNyisKF1N1hcgAUczCjNO7WMtPVBdrARmz
 egtsXorQhF37gw3HbbUtfXrxq2XQrE2wmHvBu5EoM/x6HPf3ceLnYN3IgLyiOlN/x6Do
 DRsICXrpWLUPjtIzZSoMuuUJFZ/mPrDSuTx3iv8AK4UQINZt35dOUNEgSNt+EjdY+Go0
 KHoddY7aGPEVnARgqgwjY9mQ9QYXfaG48jOFR7Gb/XIGQFTMNbnwbePbnjdRQfvcvOFs
 z4nw==
X-Gm-Message-State: AOAM530JYYvni1UFd5bPOQvbX8FYNEPC0TuwY7W2Kuh8sZICsjZgvfdW
 AzMWRwk4FKmkLWeRNb+5RQ==
X-Google-Smtp-Source: ABdhPJzSKRDnrny8BKo9He5QTFTcAXpqrnhpYOyi4zRLtD4q9a2RlGz5Mr2RHgWmvJf67C+lU0kTdg==
X-Received: by 2002:ac8:7d49:0:b0:304:e4ce:3345 with SMTP id
 h9-20020ac87d49000000b00304e4ce3345mr7305436qtb.508.1654468713846; 
 Sun, 05 Jun 2022 15:38:33 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:1bdb:2e61:f12:452:5315:9c7e])
 by smtp.gmail.com with ESMTPSA id
 w184-20020a3794c1000000b006a098381abcsm10168131qkd.114.2022.06.05.15.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 15:38:33 -0700 (PDT)
Received: (nullmailer pid 3657152 invoked by uid 1000);
 Sun, 05 Jun 2022 22:38:30 -0000
Date: Sun, 5 Jun 2022 17:38:30 -0500
From: Rob Herring <robh@kernel.org>
To: Krishna <quic_mkrishn@quicinc.com>
Subject: Re: [PATCH v1] dt-bindings: msm: update maintainers list with proper
 id
Message-ID: <20220605223830.GA3657088-robh@kernel.org>
References: <1654166998-14907-1-git-send-email-quic_mkrishn@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1654166998-14907-1-git-send-email-quic_mkrishn@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Jun 2022 16:19:58 +0530, Krishna wrote:
> From: Krishna Manikandan <quic_mkrishn@quicinc.com>
> 
> Use quic id instead of codeaurora id in maintainers list
> for display devicetree bindings.
> 
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml          | 2 +-
>  Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml          | 2 +-
>  Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml          | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml        | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml        | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml        | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml        | 2 +-
>  Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml      | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
> 

Applied, thanks!
