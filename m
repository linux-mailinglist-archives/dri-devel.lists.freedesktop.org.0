Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED41D8617E2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 17:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F0C610EC5F;
	Fri, 23 Feb 2024 16:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FDL5Y02+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0BB10EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 16:28:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 69BC5CE2D5C;
 Fri, 23 Feb 2024 16:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4B0C433F1;
 Fri, 23 Feb 2024 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708705727;
 bh=MKwvCMy8mgFWdbvzLyOsYqWArU5NYYRlO+TE1+VYsX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FDL5Y02+HEIiYaW0kbThPhPZ5tpkcEb6j8qRIscIJQcZKJqdHUcl6flVaSz66yUg7
 BMle0D2XUu60z49ecU5S+lXh/RmAHkziGc6RKUdso/xlD6G0q5n0Zt7vxBMkZsyQGK
 AFlWcWyfa2TV/wK+DwSvpPQasjAsjE8ySm5hFRTwRICxPrl7KRIzksFx26MA2v/6ui
 CCak8RETlNWeV49Jpu+d/FMOHeWtejvHrT+7JV6vztuGSAfTjH8GYlJShrwVMj6toa
 q1AmEnwkCppWTlGYZPTqGd02csea04b7DzYGhkuVFo2uHJ9H7tkiGTTXR1MEPMZnQm
 wvsZC8x59WyVA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 pavel@ucw.cz, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, andersson@kernel.org, quic_kgunda@quicinc.com, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
References: <20240202180151.4116329-1-quic_jhugo@quicinc.com>
Subject: Re: (subset) [PATCH] dt-bindings: backlight: qcom-wled: Fix
 bouncing email addresses
Message-Id: <170870572457.1740438.258994199463486668.b4-ty@kernel.org>
Date: Fri, 23 Feb 2024 16:28:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Feb 2024 11:01:51 -0700, Jeffrey Hugo wrote:
> Bjorn is no longer at Linaro.  Update his email address to @kernel to
> match the .mailmap entry.
> 
> The servers for @codeaurora are long retired and messages sent there
> will bounce.  Update Kiran's email address to match the .mailmap entry.
> 
> This will help anyone that is looking to reach out about this binding
> and is not using .mailmap to pre-process their message.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: backlight: qcom-wled: Fix bouncing email addresses
      commit: f842d487c6a2f17a9d4d9bbcbfdb90b49adac71d

--
Lee Jones [李琼斯]

