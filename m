Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBA785948
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 15:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6AB10E032;
	Wed, 23 Aug 2023 13:29:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD5A10E032
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 13:28:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F277C662E5;
 Wed, 23 Aug 2023 13:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ABDBC433C7;
 Wed, 23 Aug 2023 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692797338;
 bh=4S6Dk3MvfyLnIMCYyIMYZa7VyYaWFKn+GW5De/l6gb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lmWEM5kMysx6okcHxfvdYNKoLGlgk7dAfV8gYV08JGtY0LZkmIQtlhj2K+/BJ9cdq
 HA00wzfCi2fB1af7R1Rz9zf6NnTZ+9ZYMlKbyoI91Z9JOJH779sXSiX/S2UJZU4IW2
 t+sxf2lOfREPzgjdVMMCOpwfuptbHWiA+RkDxvpRs44Lu98ev6YXuqvJq0dis4Qst1
 W/Wv2GtnkGleAuhVWHD5kYiV9GDs5OapSj8YCSr3Ls2a4+8EyihYYfWggnHA7mOmin
 sYnyQAGShxeFzAZCVARMYAo+Bchkjhq6WKXk27Qc98ZL1jZKJ4DSJPEexY8SHG4N8p
 ayku6VhCvPt2Q==
Received: (nullmailer pid 2214579 invoked by uid 1000);
 Wed, 23 Aug 2023 13:28:56 -0000
Date: Wed, 23 Aug 2023 08:28:56 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: advantech,idk-2121wr: reference
 common panel
Message-ID: <169279733533.2214500.4453589931480944144.robh@kernel.org>
References: <20230823081107.82967-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823081107.82967-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 23 Aug 2023 10:11:07 +0200, Krzysztof Kozlowski wrote:
> Reference common panel bindings to bring descriptions of common fields
> like panel-timing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/advantech,idk-2121wr.yaml           | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

