Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2F66E5EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:27:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5445010E5C5;
	Tue, 17 Jan 2023 18:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 573 seconds by postgrey-1.36 at gabe;
 Tue, 17 Jan 2023 18:27:23 UTC
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB80010E5AC;
 Tue, 17 Jan 2023 18:27:23 +0000 (UTC)
Received: from [10.0.0.182] (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id EA6C7160BFD;
 Tue, 17 Jan 2023 19:17:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1673979468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYHREfibG8rZLgmN70q3NiQ3z4p8ZY+IxuPByvxNo8c=;
 b=QaCadAfIRc6FF3sNoisiLvoPLSieMPPIluQk63GD/hi6EJARK2kalK4G9Q6UFuWIG18BIS
 oZUL5yDRko8kkpO0GeetfWKn2jYH71QADw9xe6AXAsDBYYbl19hnQAmEfVRK/v6FuxjtrB
 b0d3LikxDaqrT91KoKmzBrR5xS7ScTk=
Message-ID: <2fb67d4e-6a2a-a416-cbcd-bcf6f3c5eae4@ixit.cz>
Date: Tue, 17 Jan 2023 19:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v8 0/3] mdss-dsi-ctrl binding and dts fixes
In-Reply-To: <20230116225217.1056258-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: krzysztof.kozlowski+dt@linaro.org, sean@poorly.run, andersson@kernel.org,
 konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robh+dt@kernel.org,
 agross@kernel.org, dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the series:

Acked-by: David Heidelberg <david@ixit.cz>

