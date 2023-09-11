Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BB579C803
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 09:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332AD10E36F;
	Tue, 12 Sep 2023 07:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 28152 seconds by postgrey-1.36 at gabe;
 Mon, 11 Sep 2023 16:51:37 UTC
Received: from out-216.mta0.migadu.com (out-216.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::d8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6550310E33D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 16:51:37 +0000 (UTC)
Date: Tue, 12 Sep 2023 02:47:30 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1694451095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJBFtilo+N7MwmK+qDpVaOWLYzmxlK73lqWxMLheTIo=;
 b=GriUB6QXaNVJraMfYdO0IAoT9YfQyYJZU4vJ0jmLhfLPYQEgcb9DBLLy8UvxVGtx+k70HO
 AhkiLR2s6cwBbAhR5TqmWDBiiQE959BG4CuRdScGXXiaGWWrRujExTMo9Kn8pla9u7LxKq
 bVXxuy7nJZpQzOxRB+UZl9YqrInmc0HQbyCcyGDvl9CcXV7/lPqoUmiHUKVifLfCit/iwl
 z/vdc58PjGGvHNNmyegZW4QGLdOCegI2yKghHQ7wMuSfm1XrccZv2q1eW05BKvy3b/SUO5
 2P+XZGpMvWSX8a5TPY3dqnM8F8rQ68f2Vv3VhmGhe8o6Kq54uD1PkL+MqTU9Fw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [RFC PATCH 8/8] dt-bindings: display: panel: add Fascontek
 FS035VG158 panel
Message-ID: <ZP9Eoh06Sirl_97l@titan>
References: <20230911090206.3121440-1-contact@jookia.org>
 <20230911090206.3121440-9-contact@jookia.org>
 <e22e61e7-02b1-8127-888d-e470838f4a18@linaro.org>
 <ZP7il27e9cExVWaL@titan>
 <c4d89d97-f8d4-da2e-dea9-6c054cf07eb3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4d89d97-f8d4-da2e-dea9-6c054cf07eb3@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 12 Sep 2023 07:19:12 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Chris Morgan <macromorgan@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 01:49:39PM +0200, Krzysztof Kozlowski wrote:
> If the other panel has exactly the same case, then yes, you can do like
> this. But it depends on the bindings - to which ones do you refer as
> your tmeplate?

Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml

> 
> Best regards,
> Krzysztof

John.
